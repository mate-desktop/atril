/*
 *  Copyright (C) 2003 Marco Pesenti Gritti
 *  Copyright (C) 2003, 2004 Christian Persch
 *
 *  Modified 2005 by James Bowes for use in atril.
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
 *  $Id$
 */

#include "config.h"

#include "ephy-zoom-action.h"
#include "ephy-zoom-control.h"
#include "ephy-zoom.h"

#include <glib-object.h>
#include <glib/gi18n.h>
#include <gtk/gtk.h>

struct _EphyZoomActionPrivate
{
	float zoom;
	float min_zoom;
	float max_zoom;
};

enum
{
	PROP_0,
	PROP_ZOOM,
	PROP_MIN_ZOOM,
	PROP_MAX_ZOOM
};


static void ephy_zoom_action_init       (EphyZoomAction *action);
static void ephy_zoom_action_class_init (EphyZoomActionClass *class);

enum
{
	ZOOM_TO_LEVEL_SIGNAL,
	LAST_SIGNAL
};

static guint signals[LAST_SIGNAL] = { 0 };

G_DEFINE_TYPE_WITH_PRIVATE (EphyZoomAction, ephy_zoom_action, GTK_TYPE_ACTION)

static void
zoom_to_level_cb (EphyZoomControl *control,
		  float zoom,
		  EphyZoomAction *action)
{
	g_signal_emit (action, signals[ZOOM_TO_LEVEL_SIGNAL], 0, zoom);
}

static void
sync_zoom_cb (GtkAction *action, GParamSpec *pspec, GtkWidget *proxy)
{
	EphyZoomAction *zoom_action = EPHY_ZOOM_ACTION (action);

	g_object_set (G_OBJECT (proxy), "zoom", zoom_action->priv->zoom, NULL);
}

static void
sync_min_zoom_cb (GtkAction *action, GParamSpec *pspec, GtkWidget *proxy)
{
	EphyZoomAction *zoom_action = EPHY_ZOOM_ACTION (action);

	g_object_set (G_OBJECT (proxy), "min-zoom", zoom_action->priv->min_zoom, NULL);
}

static void
sync_max_zoom_cb (GtkAction *action, GParamSpec *pspec, GtkWidget *proxy)
{
	EphyZoomAction *zoom_action = EPHY_ZOOM_ACTION (action);

	g_object_set (G_OBJECT (proxy), "max-zoom", zoom_action->priv->max_zoom, NULL);
}

static void
connect_proxy (GtkAction *action, GtkWidget *proxy)
{
	if (EPHY_IS_ZOOM_CONTROL (proxy))
	{
		g_signal_connect_object (action, "notify::zoom",
					 G_CALLBACK (sync_zoom_cb), proxy, 0);
		g_signal_connect_object (action, "notify::min-zoom",
					 G_CALLBACK (sync_min_zoom_cb), proxy, 0);
		g_signal_connect_object (action, "notify::max-zoom",
					 G_CALLBACK (sync_max_zoom_cb), proxy, 0);
		g_signal_connect (proxy, "zoom_to_level",
				  G_CALLBACK (zoom_to_level_cb), action);
	}

	GTK_ACTION_CLASS (ephy_zoom_action_parent_class)->connect_proxy (action, proxy);
}

static void
proxy_menu_activate_cb (GtkMenuItem *menu_item, EphyZoomAction *action)
{
	gint index;
	float zoom;

	/* menu item was toggled OFF */
	if (!gtk_check_menu_item_get_active (GTK_CHECK_MENU_ITEM (menu_item))) return;

	index = GPOINTER_TO_INT (g_object_get_data (G_OBJECT (menu_item), "zoom-level"));
	zoom = zoom_levels[index].level;

	if (zoom != action->priv->zoom)
	{
		g_signal_emit (action, signals[ZOOM_TO_LEVEL_SIGNAL], 0, zoom);
	}
}

static GtkWidget *
create_menu_item (GtkAction *action)
{
	EphyZoomActionPrivate *p = EPHY_ZOOM_ACTION (action)->priv;
	GtkWidget *menu, *menu_item;
	GSList *group = NULL;
	int i;

	menu = gtk_menu_new ();

	for (i = 0; i < n_zoom_levels; i++)
	{
		if (zoom_levels[i].level == EPHY_ZOOM_SEPARATOR) 
		{
			menu_item = gtk_separator_menu_item_new ();
		} 
		else 
		{
			menu_item = gtk_radio_menu_item_new_with_label (group, 
									_(zoom_levels[i].name));
			group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (menu_item));

                        gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (menu_item),
                                                        p->zoom == zoom_levels[i].level);
        
                        g_object_set_data (G_OBJECT (menu_item), "zoom-level", GINT_TO_POINTER (i));
                        g_signal_connect_object (G_OBJECT (menu_item), "activate",
                                                G_CALLBACK (proxy_menu_activate_cb), action, 0);
                }
        
                gtk_widget_show (menu_item);
		gtk_menu_shell_append (GTK_MENU_SHELL (menu), menu_item);
	}

	gtk_widget_show (menu);

        menu_item = GTK_ACTION_CLASS (ephy_zoom_action_parent_class)->create_menu_item (action);

	gtk_menu_item_set_submenu (GTK_MENU_ITEM (menu_item), menu);

	gtk_widget_show (menu_item);

	return menu_item;
}

static void
ephy_zoom_action_set_property (GObject *object,
			       guint prop_id,
			       const GValue *value,
			       GParamSpec *pspec)
{
	EphyZoomAction *action;

	action = EPHY_ZOOM_ACTION (object);

	switch (prop_id)
	{
		case PROP_ZOOM:
			action->priv->zoom = g_value_get_float (value);
			break;
	        case PROP_MIN_ZOOM:
			action->priv->min_zoom = g_value_get_float (value);
			break;
	        case PROP_MAX_ZOOM:
			action->priv->max_zoom = g_value_get_float (value);
			break;
	}
}

static void
ephy_zoom_action_get_property (GObject *object,
			       guint prop_id,
			       GValue *value,
			       GParamSpec *pspec)
{
	EphyZoomAction *action;

	action = EPHY_ZOOM_ACTION (object);

	switch (prop_id)
	{
		case PROP_ZOOM:
			g_value_set_float (value, action->priv->zoom);
			break;
		case PROP_MIN_ZOOM:
			g_value_set_float (value, action->priv->min_zoom);
			break;
		case PROP_MAX_ZOOM:
			g_value_set_float (value, action->priv->max_zoom);
			break;
	}
}

static void
ephy_zoom_action_class_init (EphyZoomActionClass *class)
{
	GObjectClass *object_class = G_OBJECT_CLASS (class);
	GtkActionClass *action_class = GTK_ACTION_CLASS (class);

	object_class->set_property = ephy_zoom_action_set_property;
	object_class->get_property = ephy_zoom_action_get_property;

	action_class->toolbar_item_type = EPHY_TYPE_ZOOM_CONTROL;
	action_class->connect_proxy = connect_proxy;
	action_class->create_menu_item = create_menu_item;

	g_object_class_install_property (object_class,
					 PROP_ZOOM,
					 g_param_spec_float ("zoom",
							     "Zoom",
							     "Zoom",
							     ZOOM_MINIMAL,
							     ZOOM_MAXIMAL,
							     1.0,
							     G_PARAM_READWRITE));
	g_object_class_install_property (object_class,
					 PROP_MIN_ZOOM,
					 g_param_spec_float ("min-zoom",
							     "MinZoom",
							     "The minimum zoom",
							     ZOOM_MINIMAL,
							     ZOOM_MAXIMAL,
							     ZOOM_MINIMAL,
							     G_PARAM_READWRITE));
	g_object_class_install_property (object_class,
					 PROP_MAX_ZOOM,
					 g_param_spec_float ("max-zoom",
							     "MaxZoom",
							     "The maximum zoom",
							     ZOOM_MINIMAL,
							     ZOOM_MAXIMAL,
							     ZOOM_MAXIMAL,
							     G_PARAM_READWRITE));

	signals[ZOOM_TO_LEVEL_SIGNAL] =
		g_signal_new ("zoom_to_level",
			      G_OBJECT_CLASS_TYPE (object_class),
			      G_SIGNAL_RUN_FIRST,
			      G_STRUCT_OFFSET (EphyZoomActionClass, zoom_to_level),
			      NULL, NULL,
			      g_cclosure_marshal_VOID__FLOAT,
			      G_TYPE_NONE,
			      1,
			      G_TYPE_FLOAT);
}

static void
ephy_zoom_action_init (EphyZoomAction *action)
{
	action->priv = ephy_zoom_action_get_instance_private (action);

	action->priv->zoom = 1.0;
}

void
ephy_zoom_action_set_zoom_level (EphyZoomAction *action, float zoom)
{
	g_return_if_fail (EPHY_IS_ZOOM_ACTION (action));

	if (zoom < ZOOM_MINIMAL || zoom > ZOOM_MAXIMAL) return;

	action->priv->zoom = zoom;
	g_object_notify (G_OBJECT (action), "zoom");
}

float
ephy_zoom_action_get_zoom_level (EphyZoomAction *action)
{
	g_return_val_if_fail (EPHY_IS_ZOOM_ACTION (action), 1.0);
	
	return action->priv->zoom;
}

void
ephy_zoom_action_set_min_zoom_level (EphyZoomAction *action,
				     float           zoom)
{
	g_return_if_fail (EPHY_IS_ZOOM_ACTION (action));

	if (zoom < ZOOM_MINIMAL || zoom > ZOOM_MAXIMAL) return;

	action->priv->min_zoom = zoom;
	if (action->priv->zoom > 0 && action->priv->zoom < zoom)
		ephy_zoom_action_set_zoom_level (action, zoom);

	g_object_notify (G_OBJECT (action), "min-zoom");
}

void
ephy_zoom_action_set_max_zoom_level (EphyZoomAction *action,
				     float           zoom)
{
	g_return_if_fail (EPHY_IS_ZOOM_ACTION (action));

	if (zoom < ZOOM_MINIMAL || zoom > ZOOM_MAXIMAL) return;

	action->priv->max_zoom = zoom;
	if (action->priv->zoom > 0 && action->priv->zoom > zoom)
		ephy_zoom_action_set_zoom_level (action, zoom);

	g_object_notify (G_OBJECT (action), "max-zoom");
}
