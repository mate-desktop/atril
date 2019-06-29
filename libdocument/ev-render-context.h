/* this file is part of atril, a mate document viewer
 *
 *  Copyright (C) 2005 Jonathan Blandford <jrb@gnome.org>
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

#if !defined (__EV_ATRIL_DOCUMENT_H_INSIDE__) && !defined (ATRIL_COMPILATION)
#error "Only <atril-document.h> can be included directly."
#endif

#ifndef EV_RENDER_CONTEXT_H
#define EV_RENDER_CONTEXT_H

#include <glib-object.h>

#include "ev-page.h"

G_BEGIN_DECLS

typedef struct _EvRenderContext EvRenderContext;
typedef struct _EvRenderContextClass EvRenderContextClass;

#define EV_TYPE_RENDER_CONTEXT		(ev_render_context_get_type())
#define EV_RENDER_CONTEXT(object)	(G_TYPE_CHECK_INSTANCE_CAST((object), EV_TYPE_RENDER_CONTEXT, EvRenderContext))
#define EV_RENDER_CONTEXT_CLASS(klass)	(G_TYPE_CHECK_CLASS_CAST((klass), EV_TYPE_RENDER_CONTEXT, EvRenderContextClass))
#define EV_IS_RENDER_CONTEXT(object)	(G_TYPE_CHECK_INSTANCE_TYPE((object), EV_TYPE_RENDER_CONTEXT))

struct _EvRenderContextClass
{
	GObjectClass klass;
};

struct _EvRenderContext
{
	GObject parent;

	EvPage *page;
	gint    rotation;
	gdouble scale;
};


GType            ev_render_context_get_type        (void) G_GNUC_CONST;
EvRenderContext *ev_render_context_new             (EvPage          *page,
						    gint             rotation,
						    gdouble          scale);
void             ev_render_context_set_page        (EvRenderContext *rc,
						    EvPage          *page);
void             ev_render_context_set_rotation    (EvRenderContext *rc,
						    gint             rotation);
void             ev_render_context_set_scale       (EvRenderContext *rc,
						    gdouble          scale);


G_END_DECLS

#endif /* !EV_RENDER_CONTEXT */
