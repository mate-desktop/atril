/* this file is part of atril, a mate document viewer
 *
 *  Copyright (C) 2014 Avishkar Gupta
 *
 *  Author:
 *   Avishkar Gupta <avishkar.gupta.delhi@gmail.com>
 *
 * Atril is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Atril is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#include "epub-document.h"
#include "ev-file-helpers.h"
#include "ev-document-find.h"
#include "ev-backends-manager.h"
#include "ev-document-links.h"

#include <gepub.h>

#include <config.h>
#include <glib/gi18n-lib.h>
#include <glib/gstdio.h>

#include <gtk/gtk.h>

typedef struct _linknode {
	gchar *pagelink;
	GList *children;
	gchar *linktext;
	guint page;
} linknode;

typedef struct _EpubDocumentClass EpubDocumentClass;

struct _EpubDocumentClass
{
	EvDocumentClass parent_class;
};

struct _EpubDocument
{
	EvDocument parent_instance;
	gchar *archivename;
	GepubDoc *gepub_doc;
	GList *index;
	gchar *docTitle;
};

static void epub_document_document_find_iface_init  (EvDocumentFindInterface  *iface);
static void epub_document_document_links_iface_init (EvDocumentLinksInterface *iface);

EV_BACKEND_REGISTER_WITH_CODE (EpubDocument, epub_document,
    {
        EV_BACKEND_IMPLEMENT_INTERFACE (EV_TYPE_DOCUMENT_FIND,
                                        epub_document_document_find_iface_init);
        EV_BACKEND_IMPLEMENT_INTERFACE (EV_TYPE_DOCUMENT_LINKS,
                                        epub_document_document_links_iface_init);
    } );

static guint
epub_document_check_hits (EvDocumentFind *document_find,
                          EvPage         *page,
                          const gchar    *text,
                          gboolean        case_sensitive)
{
	return 0;
}

static void
free_link_nodes (gpointer data)
{
	linknode *node = data;
	g_free (node->pagelink);
	g_free (node->linktext);
	if (node->children)
		g_list_free_full (node->children, free_link_nodes);
	g_free (node);
}

static gboolean
epub_document_links_has_document_links (EvDocumentLinks *document_links)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document_links);

	g_return_val_if_fail (EPUB_IS_DOCUMENT (epub_document), FALSE);

	return epub_document->index != NULL;
}

typedef struct {
	GtkTreeModel *model;
	GtkTreeIter  *parent;
} LinksCBStruct;

static void
epub_document_make_tree_entry (linknode *list_data, LinksCBStruct *user_data)
{
	GtkTreeIter tree_iter;
	EvLink *link = NULL;
	EvLinkDest *ev_dest = NULL;
	EvLinkAction *ev_action;
	char *title_markup;

	if (g_strrstr (list_data->pagelink, "#") == NULL) {
		ev_dest = ev_link_dest_new_page (list_data->page);
	} else {
		gchar *hlink_uri = g_strdup_printf ("epub:///%s", list_data->pagelink);
		ev_dest = ev_link_dest_new_hlink (hlink_uri, list_data->page);
		g_free (hlink_uri);
	}

	ev_action = ev_link_action_new_dest (ev_dest);
	link = ev_link_new (list_data->linktext, ev_action);

	gtk_tree_store_append (GTK_TREE_STORE (user_data->model), &tree_iter, user_data->parent);
	title_markup = g_markup_escape_text (list_data->linktext, -1);

	gtk_tree_store_set (GTK_TREE_STORE (user_data->model), &tree_iter,
	                    EV_DOCUMENT_LINKS_COLUMN_MARKUP, title_markup,
	                    EV_DOCUMENT_LINKS_COLUMN_LINK, link,
	                    EV_DOCUMENT_LINKS_COLUMN_EXPAND, (list_data->children != NULL),
	                    -1);

	if (list_data->children) {
		LinksCBStruct child_struct;
		child_struct.parent = &tree_iter;
		child_struct.model = user_data->model;
		g_list_foreach (list_data->children, (GFunc) epub_document_make_tree_entry, &child_struct);
	}

	g_free (title_markup);
	g_object_unref (link);
}

static GtkTreeModel *
epub_document_links_get_links_model (EvDocumentLinks *document_links)
{
	GtkTreeModel *model = NULL;
	EpubDocument *epub_document = EPUB_DOCUMENT (document_links);

	g_return_val_if_fail (EPUB_IS_DOCUMENT (document_links), NULL);

	model = (GtkTreeModel *) gtk_tree_store_new (EV_DOCUMENT_LINKS_COLUMN_NUM_COLUMNS,
	                                             G_TYPE_STRING,
	                                             G_TYPE_OBJECT,
	                                             G_TYPE_BOOLEAN,
	                                             G_TYPE_STRING);

	LinksCBStruct link_struct;
	link_struct.model = model;

	EvLink *link = ev_link_new (epub_document->docTitle,
	                            ev_link_action_new_dest (ev_link_dest_new_page (0)));
	GtkTreeIter parent;
	link_struct.parent = &parent;

	gtk_tree_store_append (GTK_TREE_STORE (model), &parent, NULL);
	gtk_tree_store_set (GTK_TREE_STORE (model), &parent,
	                    EV_DOCUMENT_LINKS_COLUMN_MARKUP, epub_document->docTitle,
	                    EV_DOCUMENT_LINKS_COLUMN_LINK, link,
	                    EV_DOCUMENT_LINKS_COLUMN_EXPAND, TRUE,
	                    -1);
	g_object_unref (link);

	if (epub_document->index)
		g_list_foreach (epub_document->index, (GFunc) epub_document_make_tree_entry, &link_struct);

	return model;
}

static EvMappingList *
epub_document_links_get_links (EvDocumentLinks *document_links,
                               EvPage          *page)
{
	return NULL;
}

static void
epub_document_document_find_iface_init (EvDocumentFindInterface *iface)
{
	iface->check_for_hits = epub_document_check_hits;
}

static void
epub_document_document_links_iface_init (EvDocumentLinksInterface *iface)
{
	iface->has_document_links = epub_document_links_has_document_links;
	iface->get_links_model = epub_document_links_get_links_model;
	iface->get_links = epub_document_links_get_links;
}

static gboolean
epub_document_save (EvDocument *document,
                    const char *uri,
                    GError    **error)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);
	gchar *source_uri = g_filename_to_uri (epub_document->archivename, NULL, error);
	if (source_uri == NULL)
		return FALSE;

	return ev_xfer_uri_simple (source_uri, uri, error);
}

static int
epub_document_get_n_pages (EvDocument *document)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);

	if (!epub_document->gepub_doc)
		return 0;

	return gepub_doc_get_n_chapters (epub_document->gepub_doc);
}

static EvPage *
epub_document_get_page (EvDocument *document,
                        gint        index)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);
	EvPage *page = ev_page_new (index);

	if (!epub_document->gepub_doc)
		return page;

	gepub_doc_set_chapter (epub_document->gepub_doc, index);
	gchar *path = gepub_doc_get_current_path (epub_document->gepub_doc);
	if (path) {
		page->backend_page = g_strdup_printf ("epub:///%s", path);
		page->backend_destroy_func = g_free;
		g_free (path);
	}

	return page;
}

static EvDocumentInfo *
epub_document_get_info (EvDocument *document)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);
	EvDocumentInfo *info = g_new0 (EvDocumentInfo, 1);

	info->fields_mask = EV_DOCUMENT_INFO_TITLE |
	                    EV_DOCUMENT_INFO_FORMAT |
	                    EV_DOCUMENT_INFO_AUTHOR |
	                    EV_DOCUMENT_INFO_SUBJECT |
	                    EV_DOCUMENT_INFO_LAYOUT |
	                    EV_DOCUMENT_INFO_PERMISSIONS |
	                    EV_DOCUMENT_INFO_N_PAGES;

	if (epub_document->gepub_doc) {
		info->title = gepub_doc_get_metadata (epub_document->gepub_doc, GEPUB_META_TITLE);
		info->author = gepub_doc_get_metadata (epub_document->gepub_doc, GEPUB_META_AUTHOR);
		info->subject = gepub_doc_get_metadata (epub_document->gepub_doc, GEPUB_META_DESC);
	}

	if (!info->title)
		info->title = g_strdup (_("Unknown"));
	if (!info->author)
		info->author = g_strdup (_("Unknown"));
	if (!info->subject)
		info->subject = g_strdup (_("Unknown"));

	info->format = g_strdup ("epub");
	info->layout = EV_DOCUMENT_LAYOUT_SINGLE_PAGE;
	info->permissions = EV_DOCUMENT_PERMISSIONS_OK_TO_COPY;
	info->n_pages = epub_document_get_n_pages (document);

	return info;
}

static GBytes *
epub_document_get_resource (EvDocument  *document,
                            const gchar *path)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);

	if (!epub_document->gepub_doc || !path)
		return NULL;

	return gepub_doc_get_resource (epub_document->gepub_doc, path);
}

static gchar *
epub_document_get_resource_mime (EvDocument  *document,
                                const gchar *path)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);

	if (!epub_document->gepub_doc || !path)
		return NULL;

	return gepub_doc_get_resource_mime (epub_document->gepub_doc, path);
}

static GList *
build_index_from_gepub_toc (EpubDocument *epub_document)
{
	GList *toc = gepub_doc_get_toc (epub_document->gepub_doc);
	GList *index = NULL;
	guint first = 0, last = 0;

	for (GList *l = toc; l; l = l->next) {
		GepubNavPoint *np = l->data;
		linknode *node = g_new0 (linknode, 1);
		node->linktext = g_strdup (np->label);
		node->pagelink = g_strdup (np->content);
		node->children = NULL;

		gint chapter = gepub_doc_resource_uri_to_chapter (
		    epub_document->gepub_doc, np->content);
		node->page = (chapter >= 0) ? chapter : 0;

		if (index)
			last = node->page;
		else
			first = node->page;

		index = g_list_prepend (index, node);
	}

	if (first < last)
		index = g_list_reverse (index);

	return index;
}

static gboolean
epub_document_load (EvDocument  *document,
                    const char  *uri,
                    GError     **error)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (document);
	GError *err = NULL;

	gchar *filepath = g_filename_from_uri (uri, NULL, &err);
	if (!filepath) {
		g_propagate_error (error, err);
		return FALSE;
	}

	epub_document->archivename = filepath;

	epub_document->gepub_doc = gepub_doc_new (filepath, &err);
	if (!epub_document->gepub_doc) {
		g_propagate_error (error, err);
		return FALSE;
	}

	epub_document->docTitle = gepub_doc_get_metadata (
	    epub_document->gepub_doc, GEPUB_META_TITLE);
	if (!epub_document->docTitle)
		epub_document->docTitle = g_strdup (_("Unknown"));

	epub_document->index = build_index_from_gepub_toc (epub_document);

	if (gepub_doc_get_n_chapters (epub_document->gepub_doc) == 0) {
		g_set_error_literal (error,
		                     EV_DOCUMENT_ERROR,
		                     EV_DOCUMENT_ERROR_INVALID,
		                     _("epub document has no pages"));
		return FALSE;
	}

	return TRUE;
}

static void
epub_document_init (EpubDocument *epub_document)
{
	epub_document->archivename = NULL;
	epub_document->gepub_doc = NULL;
	epub_document->index = NULL;
	epub_document->docTitle = NULL;
}

static void
epub_document_finalize (GObject *object)
{
	EpubDocument *epub_document = EPUB_DOCUMENT (object);

	g_clear_object (&epub_document->gepub_doc);

	if (epub_document->index) {
		g_list_free_full (epub_document->index, free_link_nodes);
		epub_document->index = NULL;
	}

	g_free (epub_document->docTitle);
	g_free (epub_document->archivename);

	G_OBJECT_CLASS (epub_document_parent_class)->finalize (object);
}

static void
epub_document_class_init (EpubDocumentClass *klass)
{
	GObjectClass    *gobject_class = G_OBJECT_CLASS (klass);
	EvDocumentClass *ev_document_class = EV_DOCUMENT_CLASS (klass);

	gobject_class->finalize = epub_document_finalize;
	ev_document_class->load = epub_document_load;
	ev_document_class->save = epub_document_save;
	ev_document_class->get_n_pages = epub_document_get_n_pages;
	ev_document_class->get_info = epub_document_get_info;
	ev_document_class->get_page = epub_document_get_page;
	ev_document_class->get_resource = epub_document_get_resource;
	ev_document_class->get_resource_mime = epub_document_get_resource_mime;
}
