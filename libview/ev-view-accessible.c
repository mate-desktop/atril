/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8; c-indent-level: 8 -*- */
/* this file is part of atril, a mate document viewer
 *
 *  Copyright (C) 2004 Red Hat, Inc
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

#include <math.h>
#include <config.h>
#include <glib/gi18n-lib.h>
#include <gtk/gtk.h>

#include "ev-selection.h"
#include "ev-page-cache.h"
#include "ev-view-accessible.h"
#include "ev-link-accessible.h"
#include "ev-view-private.h"
#include "ev-page-accessible.h"

static void ev_view_accessible_action_iface_init    (AtkActionIface    *iface);
static void ev_view_accessible_hypertext_iface_init (AtkHypertextIface *iface);
static void ev_view_accessible_document_iface_init  (AtkDocumentIface  *iface);

enum {
	ACTION_SCROLL_UP,
	ACTION_SCROLL_DOWN,
	LAST_ACTION
};

static const gchar *const ev_view_accessible_action_names[] =
{
	N_("Scroll Up"),
	N_("Scroll Down"),
	NULL
};

static const gchar *const ev_view_accessible_action_descriptions[] =
{
	N_("Scroll View Up"),
	N_("Scroll View Down"),
	NULL
};

struct _EvViewAccessiblePrivate {
	EvDocumentModel *model;

	/* AtkAction */
	gchar        *action_descriptions[LAST_ACTION];
	guint         action_idle_handler;
	GtkScrollType idle_scroll;

	/* AtkHypertext */
	GHashTable    *links;

	gint previous_cursor_page;

	GPtrArray *children;
};

G_DEFINE_TYPE_WITH_CODE (EvViewAccessible, ev_view_accessible, GTK_TYPE_CONTAINER_ACCESSIBLE,
			 G_IMPLEMENT_INTERFACE (ATK_TYPE_ACTION, ev_view_accessible_action_iface_init)
			 G_IMPLEMENT_INTERFACE (ATK_TYPE_HYPERTEXT, ev_view_accessible_hypertext_iface_init)
			 G_IMPLEMENT_INTERFACE (ATK_TYPE_DOCUMENT, ev_view_accessible_document_iface_init)
	)

static gint
get_relevant_page (EvView *view)
{
	return ev_view_is_caret_navigation_enabled (view) ? view->cursor_page : view->current_page;
}

static void
clear_cache (EvViewAccessible *accessible)
{
	EvViewAccessiblePrivate* priv = accessible->priv;

	g_clear_pointer (&priv->links, (GDestroyNotify)g_hash_table_destroy);
}

static void
clear_children (EvViewAccessible *self)
{
	gint i;
	AtkObject *child;

	if (self->priv->children == NULL)
		return;

	for (i = 0; i < self->priv->children->len; i++) {
		child = g_ptr_array_index (self->priv->children, i);
		atk_object_notify_state_change (child, ATK_STATE_DEFUNCT, TRUE);
	}

	g_clear_pointer (&self->priv->children, g_ptr_array_unref);
}

static void
ev_view_accessible_finalize (GObject *object)
{
	EvViewAccessiblePrivate *priv = EV_VIEW_ACCESSIBLE (object)->priv;
	int i;

	if (priv->model) {
		g_signal_handlers_disconnect_by_data (priv->model, object);
		g_object_unref (priv->model);
		priv->model = NULL;
	}
	if (priv->action_idle_handler)
		g_source_remove (priv->action_idle_handler);
	for (i = 0; i < LAST_ACTION; i++)
		g_free (priv->action_descriptions [i]);
	clear_cache (EV_VIEW_ACCESSIBLE (object));
	clear_children (EV_VIEW_ACCESSIBLE (object));

	G_OBJECT_CLASS (ev_view_accessible_parent_class)->finalize (object);
}

static void
ev_view_accessible_initialize (AtkObject *obj,
			       gpointer   data)
{
	if (ATK_OBJECT_CLASS (ev_view_accessible_parent_class)->initialize != NULL)
		ATK_OBJECT_CLASS (ev_view_accessible_parent_class)->initialize (obj, data);

	gtk_accessible_set_widget (GTK_ACCESSIBLE (obj), GTK_WIDGET (data));

	atk_object_set_name (obj, _("Document View"));
	atk_object_set_role (obj, ATK_ROLE_DOCUMENT_FRAME);
}

static gint
ev_view_accessible_get_n_pages (EvViewAccessible *self)
{
	return self->priv->children == NULL ? 0 : self->priv->children->len;
}

static AtkObject *
ev_view_accessible_ref_child (AtkObject *obj,
			      gint       i)
{
	EvViewAccessible *self;

	g_return_val_if_fail (EV_IS_VIEW_ACCESSIBLE (obj), NULL);
	self = EV_VIEW_ACCESSIBLE (obj);
	g_return_val_if_fail (i >= 0 || i < ev_view_accessible_get_n_pages (self), NULL);

	return g_object_ref (g_ptr_array_index (self->priv->children, i));
}

static gint
ev_view_accessible_get_n_children (AtkObject *obj)
{
	return ev_view_accessible_get_n_pages (EV_VIEW_ACCESSIBLE (obj));
}

static void
ev_view_accessible_class_init (EvViewAccessibleClass *klass)
{
	GObjectClass *object_class = G_OBJECT_CLASS (klass);
	AtkObjectClass *atk_class = ATK_OBJECT_CLASS (klass);

	object_class->finalize = ev_view_accessible_finalize;
	atk_class->initialize = ev_view_accessible_initialize;
	atk_class->get_n_children = ev_view_accessible_get_n_children;
	atk_class->ref_child = ev_view_accessible_ref_child;

	g_type_class_add_private (klass, sizeof (EvViewAccessiblePrivate));
}

static void
ev_view_accessible_init (EvViewAccessible *accessible)
{
	accessible->priv = G_TYPE_INSTANCE_GET_PRIVATE (accessible, EV_TYPE_VIEW_ACCESSIBLE, EvViewAccessiblePrivate);
}

static gint
ev_view_accessible_get_page_count (AtkDocument *atk_document)
{
	g_return_val_if_fail (EV_IS_VIEW_ACCESSIBLE (atk_document), -1);

	return ev_view_accessible_get_n_pages (EV_VIEW_ACCESSIBLE (atk_document));
}

static gint
ev_view_accessible_get_current_page_number (AtkDocument *atk_document)
{
	GtkWidget *widget;

	g_return_val_if_fail (EV_IS_VIEW_ACCESSIBLE (atk_document), -1);

	widget = gtk_accessible_get_widget (GTK_ACCESSIBLE (atk_document));
	if (widget == NULL)
		return -1;

	/* +1 as user starts to count on 1, but evince starts on 0 */
	return get_relevant_page (EV_VIEW (widget)) + 1;
}

static void
ev_view_accessible_document_iface_init (AtkDocumentIface *iface)
{
	iface->get_current_page_number = ev_view_accessible_get_current_page_number;
	iface->get_page_count = ev_view_accessible_get_page_count;
}

static gboolean
ev_view_accessible_idle_do_action (gpointer data)
{
	EvViewAccessiblePrivate* priv = EV_VIEW_ACCESSIBLE (data)->priv;

	ev_view_scroll (EV_VIEW (gtk_accessible_get_widget (GTK_ACCESSIBLE (data))),
	                priv->idle_scroll,
	                FALSE);
	priv->action_idle_handler = 0;
	return FALSE;
}

static gboolean
ev_view_accessible_action_do_action (AtkAction *action,
				     gint       i)
{
	EvViewAccessiblePrivate* priv = EV_VIEW_ACCESSIBLE (action)->priv;

	if (gtk_accessible_get_widget (GTK_ACCESSIBLE (action)) == NULL)
		return FALSE;

	if (priv->action_idle_handler)
		return FALSE;

	switch (i) {
	case ACTION_SCROLL_UP:
		priv->idle_scroll = GTK_SCROLL_PAGE_BACKWARD;
		break;
	case ACTION_SCROLL_DOWN:
		priv->idle_scroll = GTK_SCROLL_PAGE_FORWARD;
		break;
	default:
		return FALSE;
	}
	priv->action_idle_handler = g_idle_add (ev_view_accessible_idle_do_action,
	                                        action);
	return TRUE;
}

static gint
ev_view_accessible_action_get_n_actions (AtkAction *action)
{
	return LAST_ACTION;
}

static const gchar *
ev_view_accessible_action_get_description (AtkAction *action,
					   gint       i)
{
	EvViewAccessiblePrivate* priv = EV_VIEW_ACCESSIBLE (action)->priv;

	if (i < 0 || i >= LAST_ACTION)
		return NULL;

	if (priv->action_descriptions[i])
		return priv->action_descriptions[i];
	else
		return ev_view_accessible_action_descriptions[i];
}

static const gchar *
ev_view_accessible_action_get_name (AtkAction *action,
				    gint       i)
{
	if (i < 0 || i >= LAST_ACTION)
		return NULL;

	return ev_view_accessible_action_names[i];
}

static gboolean
ev_view_accessible_action_set_description (AtkAction   *action,
					   gint         i,
					   const gchar *description)
{
	EvViewAccessiblePrivate* priv = EV_VIEW_ACCESSIBLE (action)->priv;
	gchar *old_description;

	if (i < 0 || i >= LAST_ACTION)
		return FALSE;

	old_description = priv->action_descriptions[i];
	priv->action_descriptions[i] = g_strdup (description);
	g_free (old_description);

	return TRUE;
}

static void
ev_view_accessible_action_iface_init (AtkActionIface * iface)
{
	iface->do_action = ev_view_accessible_action_do_action;
	iface->get_n_actions = ev_view_accessible_action_get_n_actions;
	iface->get_description = ev_view_accessible_action_get_description;
	iface->get_name = ev_view_accessible_action_get_name;
	iface->set_description = ev_view_accessible_action_set_description;
}

static GHashTable *
ev_view_accessible_get_links (EvViewAccessible *accessible,
			      EvView           *view)
{
	EvViewAccessiblePrivate* priv = accessible->priv;

	if (priv->links)
		return priv->links;

	priv->links = g_hash_table_new_full (g_direct_hash,
					     g_direct_equal,
					     NULL,
					     (GDestroyNotify)g_object_unref);
	return priv->links;
}

static AtkHyperlink *
ev_view_accessible_get_link (AtkHypertext *hypertext,
			     gint          link_index)
{
	GtkWidget        *widget;
	EvView           *view;
	GHashTable       *links;
	EvMappingList    *link_mapping;
	gint              n_links;
	EvMapping        *mapping;
	EvLinkAccessible *atk_link;

	if (link_index < 0)
		return NULL;

	widget = gtk_accessible_get_widget (GTK_ACCESSIBLE (hypertext));
	if (widget == NULL)
		/* State is defunct */
		return NULL;

	view = EV_VIEW (widget);
	if (!EV_IS_DOCUMENT_LINKS (view->document))
		return NULL;

	links = ev_view_accessible_get_links (EV_VIEW_ACCESSIBLE (hypertext), view);

	atk_link = g_hash_table_lookup (links, GINT_TO_POINTER (link_index));
	if (atk_link)
		return atk_hyperlink_impl_get_hyperlink (ATK_HYPERLINK_IMPL (atk_link));

	link_mapping = ev_page_cache_get_link_mapping (view->page_cache, get_relevant_page (view));
	if (!link_mapping)
		return NULL;

	n_links = ev_mapping_list_length (link_mapping);
	if (link_index > n_links - 1)
		return NULL;

	mapping = ev_mapping_list_nth (link_mapping, n_links - link_index - 1);
	atk_link = ev_link_accessible_new (EV_VIEW_ACCESSIBLE (hypertext),
					   EV_LINK (mapping->data),
					   &mapping->area);
	g_hash_table_insert (links, GINT_TO_POINTER (link_index), atk_link);

	return atk_hyperlink_impl_get_hyperlink (ATK_HYPERLINK_IMPL (atk_link));
}

static gint
ev_view_accessible_get_n_links (AtkHypertext *hypertext)
{
	GtkWidget     *widget;
	EvView        *view;
	EvMappingList *link_mapping;

	widget = gtk_accessible_get_widget (GTK_ACCESSIBLE (hypertext));
	if (widget == NULL)
		/* State is defunct */
		return 0;

	view = EV_VIEW (widget);
	if (!EV_IS_DOCUMENT_LINKS (view->document))
		return 0;

	link_mapping = ev_page_cache_get_link_mapping (view->page_cache, get_relevant_page (view));

	return link_mapping ? ev_mapping_list_length (link_mapping) : 0;
}

static gint
ev_view_accessible_get_link_index (AtkHypertext *hypertext,
				   gint          offset)
{
	guint i;

	for (i = 0; i < ev_view_accessible_get_n_links (hypertext); i++) {
		AtkHyperlink *hyperlink;
		gint          start_index, end_index;

		hyperlink = ev_view_accessible_get_link (hypertext, i);
		start_index = atk_hyperlink_get_start_index (hyperlink);
		end_index = atk_hyperlink_get_end_index (hyperlink);

		if (start_index <= offset && end_index >= offset)
			return i;
	}

	return -1;
}

static void
ev_view_accessible_hypertext_iface_init (AtkHypertextIface *iface)
{
	iface->get_link = ev_view_accessible_get_link;
	iface->get_n_links = ev_view_accessible_get_n_links;
	iface->get_link_index = ev_view_accessible_get_link_index;
}

static void
ev_view_accessible_cursor_moved (EvView *view,
                                 gint page,
                                 gint offset,
                                 EvViewAccessible *accessible)
{
	EvViewAccessiblePrivate* priv = accessible->priv;
	EvPageAccessible *page_accessible = NULL;

	if (priv->previous_cursor_page != page) {
		priv->previous_cursor_page = page;
		clear_cache (accessible);
		/* +1 as user start to count on 1, but evince starts on 0 */
		g_signal_emit_by_name (accessible, "page-changed", page + 1);
	}

	page_accessible = g_ptr_array_index (priv->children, page);
	g_signal_emit_by_name (page_accessible, "text-caret-moved", offset);
}

static void
ev_view_accessible_selection_changed (EvView *view,
                                      EvViewAccessible *view_accessible)
{
	AtkObject *page_accessible;

	page_accessible = g_ptr_array_index (view_accessible->priv->children,
					     get_relevant_page (view));
	g_signal_emit_by_name (page_accessible, "text-selection-changed");
}

static void
page_changed_cb (EvDocumentModel  *model,
                 gint              old_page,
                 gint              new_page,
                 EvViewAccessible *accessible)
{
	clear_cache (accessible);
	EvView *view;

	view = EV_VIEW (gtk_accessible_get_widget (GTK_ACCESSIBLE (accessible)));
	if (!ev_view_is_caret_navigation_enabled (view))
		g_signal_emit_by_name (accessible, "page-changed", new_page + 1);
}

static void
initialize_children (EvViewAccessible *self)
{
	gint i;
	EvPageAccessible *child;
	gint n_pages;
	EvDocument *ev_document;

	ev_document = ev_document_model_get_document (self->priv->model);
	n_pages = ev_document_get_n_pages (ev_document);

	self->priv->children = g_ptr_array_new_full (n_pages, (GDestroyNotify) g_object_unref);
	for (i = 0; i < n_pages; i++) {
		child = ev_page_accessible_new (self, i);
		g_ptr_array_add (self->priv->children, child);
	}
}

static void
document_changed_cb (EvDocumentModel  *model,
                     GParamSpec       *pspec,
                     EvViewAccessible *accessible)
{
	EvDocument *document = ev_document_model_get_document (model);

	clear_children (accessible);

	if (document == NULL)
		return;

	clear_cache (accessible);
	initialize_children (accessible);

	/* Inside this callback the document is already loaded. We
	 * don't have here an "just before" and "just after"
	 * signal. We emit both in a row, as usual ATs uses reload to
	 * know that current content has changed, and load-complete to
	 * know that the content is already available.
	 */
	g_signal_emit_by_name (accessible, "reload");
	g_signal_emit_by_name (accessible, "load-complete");
}

void
ev_view_accessible_set_model (EvViewAccessible *accessible,
                              EvDocumentModel  *model)
{
	EvViewAccessiblePrivate* priv = accessible->priv;

	if (priv->model == model)
		return;

	if (priv->model) {
		g_signal_handlers_disconnect_by_data (priv->model, accessible);
		g_object_unref (priv->model);
	}

	priv->model = g_object_ref (model);

	document_changed_cb (model, NULL, accessible);
	g_signal_connect (priv->model, "page-changed",
	                  G_CALLBACK (page_changed_cb),
	                  accessible);
	g_signal_connect (priv->model, "notify::document",
	                  G_CALLBACK (document_changed_cb),
	                  accessible);
}

AtkObject *
ev_view_accessible_new (GtkWidget *widget)
{
	AtkObject *accessible;
	EvView    *view;

	g_return_val_if_fail (EV_IS_VIEW (widget), NULL);

	accessible = g_object_new (EV_TYPE_VIEW_ACCESSIBLE, NULL);
	atk_object_initialize (accessible, widget);

	g_signal_connect (widget, "cursor-moved",
	                  G_CALLBACK (ev_view_accessible_cursor_moved),
	                  accessible);
	g_signal_connect (widget, "selection-changed",
	                  G_CALLBACK (ev_view_accessible_selection_changed),
	                  accessible);

	view = EV_VIEW (widget);
	if (view->model)
		ev_view_accessible_set_model (EV_VIEW_ACCESSIBLE (accessible),
		                              view->model);

	return accessible;
}

