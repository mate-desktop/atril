/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8; c-indent-level: 8 -*- */
/*
 *  Copyright (C) 2004 Anders Carlsson <andersca@gnome.org>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2, or (at your option)
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 */

#include <config.h>

#include "ev-utils.h"
#include "ev-file-helpers.h"

#include <string.h>
#include <glib/gi18n.h>

void           
file_chooser_dialog_add_writable_pixbuf_formats (GtkFileChooser *chooser)
{
	GSList *pixbuf_formats = NULL;
	GSList *iter;
	GtkFileFilter *filter;
	int i;
  
	filter = gtk_file_filter_new();
	gtk_file_filter_set_name (filter, _("By extension"));
	g_object_set_data (G_OBJECT(filter), "pixbuf-format", NULL);
	gtk_file_chooser_add_filter (chooser, filter);

	pixbuf_formats = gdk_pixbuf_get_formats ();

	for (iter = pixbuf_formats; iter; iter = iter->next) {
		GdkPixbufFormat *format = iter->data;

	        gchar *description, *name, *extensions;
		gchar **extension_list, **mime_types;

		if (gdk_pixbuf_format_is_disabled (format) ||
	    	    !gdk_pixbuf_format_is_writable (format))
		            continue;

	        name = gdk_pixbuf_format_get_description (format);
	        extension_list = gdk_pixbuf_format_get_extensions (format);
	        extensions = g_strjoinv (", ", extension_list);
		g_strfreev (extension_list);
		description = g_strdup_printf ("%s (%s)", name, extensions);

		filter = gtk_file_filter_new ();
		gtk_file_filter_set_name (filter, description);
		g_object_set_data (G_OBJECT (filter), "pixbuf-format", format);
		gtk_file_chooser_add_filter (chooser, filter);

		g_free (description);
		g_free (extensions);
		g_free (name);

		mime_types = gdk_pixbuf_format_get_mime_types (format);
		for (i = 0; mime_types[i] != 0; i++)
			gtk_file_filter_add_mime_type (filter, mime_types[i]);
		g_strfreev (mime_types);
	}

	g_slist_free (pixbuf_formats);
}

GdkPixbufFormat*
get_gdk_pixbuf_format_by_extension (gchar *uri)
{
	GSList *pixbuf_formats = NULL;
	GSList *iter;
	int i;

	pixbuf_formats = gdk_pixbuf_get_formats ();

	for (iter = pixbuf_formats; iter; iter = iter->next) {
		gchar **extension_list;
		GdkPixbufFormat *format = iter->data;
		
		if (gdk_pixbuf_format_is_disabled (format) ||
	    	    !gdk_pixbuf_format_is_writable (format))
		            continue;

	        extension_list = gdk_pixbuf_format_get_extensions (format);

		for (i = 0; extension_list[i] != 0; i++) {
			if (g_str_has_suffix (uri, extension_list[i])) {
			    	g_slist_free (pixbuf_formats);
				g_strfreev (extension_list);
				return format;
			}
		}
		g_strfreev (extension_list);
	}

	g_slist_free (pixbuf_formats);
	return NULL;
}
