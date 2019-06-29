/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8; c-indent-level: 8 -*- */
/*
 * Copyright (C) 2005, Nickolay V. Shmyrev <nshmyrev@yandex.ru>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#include "config.h"

#include "dvi-document.h"
#include "ev-document-thumbnails.h"
#include "ev-document-misc.h"
#include "ev-file-exporter.h"
#include "ev-file-helpers.h"

#include "mdvi.h"
#include "fonts.h"
#include "color.h"
#include "cairo-device.h"

#include <glib/gi18n-lib.h>
#include <ctype.h>
#include <sys/wait.h>
#include <stdlib.h>

GMutex dvi_context_mutex;

enum {
	PROP_0,
	PROP_TITLE
};

struct _DviDocumentClass
{
	EvDocumentClass parent_class;
};

struct _DviDocument
{
	EvDocument parent_instance;

	DviContext *context;
	DviPageSpec *spec;
	DviParams *params;

	/* To let document scale we should remember width and height */
	double base_width;
	double base_height;

	gchar *uri;

	/* PDF exporter */
	gchar		 *exporter_filename;
	GString 	 *exporter_opts;
};

typedef struct _DviDocumentClass DviDocumentClass;

static void dvi_document_document_thumbnails_iface_init (EvDocumentThumbnailsInterface *iface);
static void dvi_document_file_exporter_iface_init	(EvFileExporterInterface       *iface);
static void dvi_document_do_color_special               (DviContext                    *dvi,
							 const char                    *prefix,
							 const char                    *arg);

EV_BACKEND_REGISTER_WITH_CODE (DviDocument, dvi_document,
     {
      EV_BACKEND_IMPLEMENT_INTERFACE (EV_TYPE_DOCUMENT_THUMBNAILS, dvi_document_document_thumbnails_iface_init);
      EV_BACKEND_IMPLEMENT_INTERFACE (EV_TYPE_FILE_EXPORTER, dvi_document_file_exporter_iface_init);
     });

static gboolean
dvi_document_load (EvDocument  *document,
		   const char  *uri,
		   GError     **error)
{
	gchar *filename;
	DviDocument *dvi_document = DVI_DOCUMENT(document);

	filename = g_filename_from_uri (uri, NULL, error);
	if (!filename)
        	return FALSE;

	g_mutex_lock (&dvi_context_mutex);
	if (dvi_document->context)
		mdvi_destroy_context (dvi_document->context);

	dvi_document->context = mdvi_init_context(dvi_document->params, dvi_document->spec, filename);
	g_mutex_unlock (&dvi_context_mutex);
	g_free (filename);

	if (!dvi_document->context) {
    		g_set_error_literal (error,
                                     EV_DOCUMENT_ERROR,
                                     EV_DOCUMENT_ERROR_INVALID,
                                     _("DVI document has incorrect format"));
        	return FALSE;
	}

	mdvi_cairo_device_init (&dvi_document->context->device);


	dvi_document->base_width = dvi_document->context->dvi_page_w * dvi_document->context->params.conv
		+ 2 * unit2pix(dvi_document->params->dpi, MDVI_HMARGIN) / dvi_document->params->hshrink;

	dvi_document->base_height = dvi_document->context->dvi_page_h * dvi_document->context->params.vconv
	        + 2 * unit2pix(dvi_document->params->vdpi, MDVI_VMARGIN) / dvi_document->params->vshrink;

	g_free (dvi_document->uri);
	dvi_document->uri = g_strdup (uri);

	return TRUE;
}


static gboolean
dvi_document_save (EvDocument  *document,
		      const char  *uri,
		      GError     **error)
{
	DviDocument *dvi_document = DVI_DOCUMENT (document);

	return ev_xfer_uri_simple (dvi_document->uri, uri, error);
}

static int
dvi_document_get_n_pages (EvDocument *document)
{
	DviDocument *dvi_document = DVI_DOCUMENT (document);

	return dvi_document->context->npages;
}

static void
dvi_document_get_page_size (EvDocument *document,
			    EvPage     *page,
			    double     *width,
			    double     *height)
{
	DviDocument *dvi_document = DVI_DOCUMENT (document);

        *width = dvi_document->base_width;
        *height = dvi_document->base_height;;
}

static cairo_surface_t *
dvi_document_render (EvDocument      *document,
		     EvRenderContext *rc)
{
	cairo_surface_t *surface;
	cairo_surface_t *rotated_surface;
	DviDocument *dvi_document = DVI_DOCUMENT(document);
	gint required_width, required_height;
	gint proposed_width, proposed_height;
	gint xmargin = 0, ymargin = 0;

	/* We should protect our context since it's not
	 * thread safe. The work to the future -
	 * let context render page independently
	 */
	g_mutex_lock (&dvi_context_mutex);

	mdvi_setpage (dvi_document->context, rc->page->index);

	mdvi_set_shrink (dvi_document->context,
			 (int)((dvi_document->params->hshrink - 1) / rc->scale) + 1,
			 (int)((dvi_document->params->vshrink - 1) / rc->scale) + 1);

	required_width = dvi_document->base_width * rc->scale + 0.5;
	required_height = dvi_document->base_height * rc->scale + 0.5;
	proposed_width = dvi_document->context->dvi_page_w * dvi_document->context->params.conv;
	proposed_height = dvi_document->context->dvi_page_h * dvi_document->context->params.vconv;

	if (required_width >= proposed_width)
	    xmargin = (required_width - proposed_width) / 2;
	if (required_height >= proposed_height)
	    ymargin = (required_height - proposed_height) / 2;

	mdvi_cairo_device_set_margins (&dvi_document->context->device, xmargin, ymargin);
	mdvi_cairo_device_set_scale (&dvi_document->context->device, rc->scale);
	mdvi_cairo_device_render (dvi_document->context);
	surface = mdvi_cairo_device_get_surface (&dvi_document->context->device);

	g_mutex_unlock (&dvi_context_mutex);

	rotated_surface = ev_document_misc_surface_rotate_and_scale (surface,
								     required_width,
								     required_height,
								     rc->rotation);
	cairo_surface_destroy (surface);

	return rotated_surface;
}

static void
dvi_document_finalize (GObject *object)
{
	DviDocument *dvi_document = DVI_DOCUMENT(object);

	g_mutex_lock (&dvi_context_mutex);
	if (dvi_document->context) {
		mdvi_cairo_device_free (&dvi_document->context->device);
		mdvi_destroy_context (dvi_document->context);
	}
	g_mutex_unlock (&dvi_context_mutex);

	if (dvi_document->params)
		g_free (dvi_document->params);

	if (dvi_document->exporter_filename)
		g_free (dvi_document->exporter_filename);

	if (dvi_document->exporter_opts)
		g_string_free (dvi_document->exporter_opts, TRUE);

        g_free (dvi_document->uri);

	G_OBJECT_CLASS (dvi_document_parent_class)->finalize (object);
}

static gboolean
dvi_document_support_synctex (EvDocument *document)
{
	return TRUE;
}

static void
dvi_document_class_init (DviDocumentClass *klass)
{
	GObjectClass    *gobject_class = G_OBJECT_CLASS (klass);
	EvDocumentClass *ev_document_class = EV_DOCUMENT_CLASS (klass);

	gobject_class->finalize = dvi_document_finalize;

	mdvi_init_kpathsea ("atril", MDVI_MFMODE, MDVI_FALLBACK_FONT, MDVI_DPI, getenv("TEXMFCNF"));

	mdvi_register_special ("Color", "color", NULL, dvi_document_do_color_special, 1);
	mdvi_register_fonts ();

	ev_document_class->load = dvi_document_load;
	ev_document_class->save = dvi_document_save;
	ev_document_class->get_n_pages = dvi_document_get_n_pages;
	ev_document_class->get_page_size = dvi_document_get_page_size;
	ev_document_class->render = dvi_document_render;
	ev_document_class->support_synctex = dvi_document_support_synctex;
}

static void
dvi_document_thumbnails_get_dimensions (EvDocumentThumbnails *document,
					EvRenderContext      *rc,
					gint                 *width,
					gint                 *height)
{
	DviDocument *dvi_document = DVI_DOCUMENT (document);
	gdouble page_width = dvi_document->base_width;
	gdouble page_height = dvi_document->base_height;

	if (rc->rotation == 90 || rc->rotation == 270) {
		*width = (gint) (page_height * rc->scale);
		*height = (gint) (page_width * rc->scale);
	} else {
		*width = (gint) (page_width * rc->scale);
		*height = (gint) (page_height * rc->scale);
	}
}

static GdkPixbuf *
dvi_document_thumbnails_get_thumbnail (EvDocumentThumbnails *document,
				       EvRenderContext      *rc,
				       gboolean 	     border)
{
	DviDocument *dvi_document = DVI_DOCUMENT (document);
	GdkPixbuf *pixbuf;
	GdkPixbuf *rotated_pixbuf;
	cairo_surface_t *surface;
	gint thumb_width, thumb_height;
	gint proposed_width, proposed_height;

	thumb_width = (gint) (dvi_document->base_width * rc->scale);
	thumb_height = (gint) (dvi_document->base_height * rc->scale);

	g_mutex_lock (&dvi_context_mutex);

	mdvi_setpage (dvi_document->context, rc->page->index);

	mdvi_set_shrink (dvi_document->context,
			  (int)dvi_document->base_width * dvi_document->params->hshrink / thumb_width,
			  (int)dvi_document->base_height * dvi_document->params->vshrink / thumb_height);

	proposed_width = dvi_document->context->dvi_page_w * dvi_document->context->params.conv;
	proposed_height = dvi_document->context->dvi_page_h * dvi_document->context->params.vconv;

	if (border) {
	 	mdvi_cairo_device_set_margins (&dvi_document->context->device,
					       MAX (thumb_width - proposed_width, 0) / 2,
					       MAX (thumb_height - proposed_height, 0) / 2);
	} else {
	 	mdvi_cairo_device_set_margins (&dvi_document->context->device,
					       MAX (thumb_width - proposed_width - 2, 0) / 2,
					       MAX (thumb_height - proposed_height - 2, 0) / 2);
	}

	mdvi_cairo_device_set_scale (&dvi_document->context->device, rc->scale);
        mdvi_cairo_device_render (dvi_document->context);
	surface = mdvi_cairo_device_get_surface (&dvi_document->context->device);
	g_mutex_unlock (&dvi_context_mutex);

	pixbuf = ev_document_misc_pixbuf_from_surface (surface);
	cairo_surface_destroy (surface);

	rotated_pixbuf = gdk_pixbuf_rotate_simple (pixbuf, 360 - rc->rotation);
	g_object_unref (pixbuf);

	if (border) {
		GdkPixbuf *tmp_pixbuf = rotated_pixbuf;

		rotated_pixbuf = ev_document_misc_get_thumbnail_frame (-1, -1, tmp_pixbuf);
		g_object_unref (tmp_pixbuf);
	}

	return rotated_pixbuf;
}

static void
dvi_document_document_thumbnails_iface_init (EvDocumentThumbnailsInterface *iface)
{
	iface->get_thumbnail = dvi_document_thumbnails_get_thumbnail;
	iface->get_dimensions = dvi_document_thumbnails_get_dimensions;
}

/* EvFileExporterIface */
static void
dvi_document_file_exporter_begin (EvFileExporter        *exporter,
				  EvFileExporterContext *fc)
{
	DviDocument *dvi_document = DVI_DOCUMENT(exporter);

	if (dvi_document->exporter_filename)
		g_free (dvi_document->exporter_filename);
	dvi_document->exporter_filename = g_strdup (fc->filename);

	if (dvi_document->exporter_opts) {
		g_string_free (dvi_document->exporter_opts, TRUE);
	}
	dvi_document->exporter_opts = g_string_new ("-s ");
}

static void
dvi_document_file_exporter_do_page (EvFileExporter  *exporter,
				    EvRenderContext *rc)
{
       DviDocument *dvi_document = DVI_DOCUMENT(exporter);

       g_string_append_printf (dvi_document->exporter_opts, "%d,", (rc->page->index) + 1);
}

static void
dvi_document_file_exporter_end (EvFileExporter *exporter)
{
	gchar *command_line;
	gint exit_stat;
	GError *err = NULL;
	gboolean success;

	DviDocument *dvi_document = DVI_DOCUMENT(exporter);
	gchar* quoted_filename = g_shell_quote (dvi_document->context->filename);

	command_line = g_strdup_printf ("dvipdfm %s -o %s %s", /* dvipdfm -s 1,2,.., -o exporter_filename dvi_filename */
					dvi_document->exporter_opts->str,
					dvi_document->exporter_filename,
					quoted_filename);
	g_free (quoted_filename);

	success = g_spawn_command_line_sync (command_line,
					     NULL,
					     NULL,
					     &exit_stat,
					     &err);

	g_free (command_line);

	if (success == FALSE) {
		g_warning ("Error: %s", err->message);
	} else if (!WIFEXITED(exit_stat) || WEXITSTATUS(exit_stat) != EXIT_SUCCESS){
		g_warning ("Error: dvipdfm does not end normally or exit with a failure status.");
	}

	if (err)
		g_error_free (err);
}

static EvFileExporterCapabilities
dvi_document_file_exporter_get_capabilities (EvFileExporter *exporter)
{
	return  EV_FILE_EXPORTER_CAN_PAGE_SET |
		EV_FILE_EXPORTER_CAN_COPIES |
		EV_FILE_EXPORTER_CAN_COLLATE |
		EV_FILE_EXPORTER_CAN_REVERSE |
		EV_FILE_EXPORTER_CAN_GENERATE_PDF;
}

static void
dvi_document_file_exporter_iface_init (EvFileExporterInterface *iface)
{
        iface->begin = dvi_document_file_exporter_begin;
        iface->do_page = dvi_document_file_exporter_do_page;
        iface->end = dvi_document_file_exporter_end;
	iface->get_capabilities = dvi_document_file_exporter_get_capabilities;
}

#define RGB2ULONG(r,g,b) ((0xFF<<24)|(r<<16)|(g<<8)|(b))

static gboolean
hsb2rgb (float h, float s, float v, guchar *red, guchar *green, guchar *blue)
{
        float f, p, q, t, r, g, b;
        int i;

        s /= 100;
        v /= 100;
        h /= 60;
        i = floor (h);
        if (i == 6)
                i = 0;
        else if ((i > 6) || (i < 0))
                return FALSE;
        f = h - i;
        p = v * (1 - s);
        q = v * (1 - (s * f));
        t = v * (1 - (s * (1 - f)));

	if (i == 0) {
		r = v;
		g = t;
		b = p;
	} else if (i == 1) {
		r = q;
		g = v;
		b = p;
	} else if (i == 2) {
		r = p;
		g = v;
		b = t;
	} else if (i == 3) {
		r = p;
		g = q;
		b = v;
	} else if (i == 4) {
		r = t;
		g = p;
		b = v;
	} else if (i == 5) {
		r = v;
		g = p;
		b = q;
	}

        *red   = (guchar)floor(r * 255.0);
        *green = (guchar)floor(g * 255.0);
        *blue  = (guchar)floor(b * 255.0);

        return TRUE;
}

static void
parse_color (const gchar *ptr,
	     gdouble     *color,
	     gint         n_color)
{
	gchar *p = (gchar *)ptr;
	gint   i;

	for (i = 0; i < n_color; i++) {
		while (isspace (*p)) p++;
		color[i] = g_ascii_strtod (p, NULL);
		while (!isspace (*p) && *p != '\0') p++;
		if (*p == '\0')
			break;
	}
}

static void
dvi_document_do_color_special (DviContext *dvi, const char *prefix, const char *arg)
{
        if (strncmp (arg, "pop", 3) == 0) {
                mdvi_pop_color (dvi);
        } else if (strncmp (arg, "push", 4) == 0) {
                /* Find color source: Named, CMYK or RGB */
                const char *tmp = arg + 4;

                while (isspace (*tmp)) tmp++;

                if (!strncmp ("rgb", tmp, 3)) {
			gdouble rgb[3];
                        guchar red, green, blue;

			parse_color (tmp + 4, rgb, 3);

                        red = 255 * rgb[0];
                        green = 255 * rgb[1];
                        blue = 255 * rgb[2];

                        mdvi_push_color (dvi, RGB2ULONG (red, green, blue), 0xFFFFFFFF);
                } else if (!strncmp ("hsb", tmp, 4)) {
                        gdouble hsb[3];
                        guchar red, green, blue;

			parse_color (tmp + 4, hsb, 3);

                        if (hsb2rgb (hsb[0], hsb[1], hsb[2], &red, &green, &blue))
                                mdvi_push_color (dvi, RGB2ULONG (red, green, blue), 0xFFFFFFFF);
                } else if (!strncmp ("cmyk", tmp, 4)) {
			gdouble cmyk[4];
                        double r, g, b;
			guchar red, green, blue;

			parse_color (tmp + 5, cmyk, 4);

                        r = 1.0 - cmyk[0] - cmyk[3];
                        if (r < 0.0)
                                r = 0.0;
                        g = 1.0 - cmyk[1] - cmyk[3];
                        if (g < 0.0)
                                g = 0.0;
                        b = 1.0 - cmyk[2] - cmyk[3];
                        if (b < 0.0)
                                b = 0.0;

			red = r * 255 + 0.5;
			green = g * 255 + 0.5;
			blue = b * 255 + 0.5;

                        mdvi_push_color (dvi, RGB2ULONG (red, green, blue), 0xFFFFFFFF);
		} else if (!strncmp ("gray ", tmp, 5)) {
			gdouble gray;
			guchar rgb;

			parse_color (tmp + 5, &gray, 1);

			rgb = gray * 255 + 0.5;

			mdvi_push_color (dvi, RGB2ULONG (rgb, rgb, rgb), 0xFFFFFFFF);
                } else {
                        GdkColor color;

                        if (gdk_color_parse (tmp, &color)) {
				guchar red, green, blue;

				red = color.red * 255 / 65535.;
				green = color.green * 255 / 65535.;
				blue = color.blue * 255 / 65535.;

                                mdvi_push_color (dvi, RGB2ULONG (red, green, blue), 0xFFFFFFFF);
			}
                }
        }
}

static void
dvi_document_init_params (DviDocument *dvi_document)
{
	dvi_document->params = g_new0 (DviParams, 1);

	dvi_document->params->dpi      = MDVI_DPI;
	dvi_document->params->vdpi     = MDVI_VDPI;
	dvi_document->params->mag      = MDVI_MAGNIFICATION;
	dvi_document->params->density  = MDVI_DEFAULT_DENSITY;
	dvi_document->params->gamma    = MDVI_DEFAULT_GAMMA;
	dvi_document->params->flags    = MDVI_PARAM_ANTIALIASED;
	dvi_document->params->hdrift   = 0;
	dvi_document->params->vdrift   = 0;
	dvi_document->params->hshrink  =  MDVI_SHRINK_FROM_DPI(dvi_document->params->dpi);
	dvi_document->params->vshrink  =  MDVI_SHRINK_FROM_DPI(dvi_document->params->vdpi);
	dvi_document->params->orientation = MDVI_ORIENT_TBLR;

	dvi_document->spec = NULL;

        dvi_document->params->bg = 0xffffffff;
        dvi_document->params->fg = 0xff000000;
}

static void
dvi_document_init (DviDocument *dvi_document)
{
	dvi_document->context = NULL;
	dvi_document_init_params (dvi_document);

	dvi_document->exporter_filename = NULL;
	dvi_document->exporter_opts = NULL;
}
