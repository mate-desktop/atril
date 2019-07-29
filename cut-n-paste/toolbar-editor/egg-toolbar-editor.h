/*
 *  Copyright (C) 2003 Marco Pesenti Gritti
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
 */

#ifndef EGG_TOOLBAR_EDITOR_H
#define EGG_TOOLBAR_EDITOR_H

#include <gtk/gtk.h>

#include "egg-toolbars-model.h"

G_BEGIN_DECLS

typedef struct EggToolbarEditorClass EggToolbarEditorClass;

#define EGG_TYPE_TOOLBAR_EDITOR             (egg_toolbar_editor_get_type ())
#define EGG_TOOLBAR_EDITOR(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), EGG_TYPE_TOOLBAR_EDITOR, EggToolbarEditor))
#define EGG_TOOLBAR_EDITOR_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), EGG_TYPE_TOOLBAR_EDITOR, EggToolbarEditorClass))
#define EGG_IS_TOOLBAR_EDITOR(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EGG_TYPE_TOOLBAR_EDITOR))
#define EGG_IS_TOOLBAR_EDITOR_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), EGG_TYPE_TOOLBAR_EDITOR))
#define EGG_TOOLBAR_EDITOR_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), EGG_TYPE_TOOLBAR_EDITOR, EggToolbarEditorClass))


typedef struct EggToolbarEditor EggToolbarEditor;
typedef struct EggToolbarEditorPrivate EggToolbarEditorPrivate;

struct EggToolbarEditor
{
  GtkBox parent_object;

  /*< private >*/
  EggToolbarEditorPrivate *priv;
};

struct EggToolbarEditorClass
{
  GtkBoxClass parent_class;
};


GType            egg_toolbar_editor_get_type     (void);
GtkWidget        *egg_toolbar_editor_new         (GtkUIManager *manager,
                                                  EggToolbarsModel *model);
void             egg_toolbar_editor_set_model    (EggToolbarEditor *t,
                                                  EggToolbarsModel *model);

G_END_DECLS

#endif
