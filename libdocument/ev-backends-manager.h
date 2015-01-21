/* this file is part of atril, a mate document viewer
 *
 *  Copyright (C) 2007 Carlos Garcia Campos <carlosgc@gnome.org>
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

#ifndef EV_BACKENDS_MANAGER
#define EV_BACKENDS_MANAGER

#include <glib.h>

#include "ev-document.h"

G_BEGIN_DECLS

typedef struct _EvTypeInfo {
	const gchar  *desc;
	const gchar **mime_types;
} EvTypeInfo;

gboolean    _ev_backends_manager_init                     (void);
void        _ev_backends_manager_shutdown                 (void);

EvDocument  *ev_backends_manager_get_document             (const gchar *mime_type);
const gchar *ev_backends_manager_get_document_module_name (EvDocument  *document);
EvTypeInfo  *ev_backends_manager_get_document_type_info   (EvDocument  *document);
GList       *ev_backends_manager_get_all_types_info       (void);
const gchar *ev_backends_manager_get_backends_dir         (void);
G_END_DECLS

#endif /* EV_BACKENDS_MANAGER */
