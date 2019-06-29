/*
 *  Copyright (C) 2003, 2004 Marco Pesenti Gritti
 *  Copyright (C) 2003, 2004 Christian Persch
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

#include "config.h"
#include "ev-navigation-action-widget.h"

#include <glib/gi18n.h>
#include <string.h>

static void  ev_navigation_action_widget_init       (EvNavigationActionWidget      *action_widget);
static void  ev_navigation_action_widget_class_init (EvNavigationActionWidgetClass *action_widget);
static void ev_navigation_action_widget_toggled (GtkToggleToolButton *toggle);
static gboolean ev_navigation_action_widget_button_press_event (GtkWidget *widget,
        	        	        		        GdkEventButton    *event,
        	        	        		        gpointer data);

G_DEFINE_TYPE (EvNavigationActionWidget, ev_navigation_action_widget, GTK_TYPE_TOGGLE_TOOL_BUTTON)

enum
{
	SHOW_MENU,
	LAST_SIGNAL
};

static guint signals[LAST_SIGNAL] = { 0 };

static void
ev_navigation_action_widget_init (EvNavigationActionWidget *action_widget)
{
	GtkWidget *toggle_button;

	/* It's rather dirty hack but we need a child to connect to
	 * button press event
	 */

	toggle_button = gtk_bin_get_child (GTK_BIN (action_widget));

	g_signal_connect (toggle_button, "button-press-event",
			  G_CALLBACK (ev_navigation_action_widget_button_press_event),
		          action_widget);
	return;
}

static void
ev_navigation_action_widget_class_init (EvNavigationActionWidgetClass *klass)
{
	GtkToggleToolButtonClass *toggle_tool_button_class = GTK_TOGGLE_TOOL_BUTTON_CLASS (klass);

	toggle_tool_button_class->toggled = ev_navigation_action_widget_toggled;

	signals[SHOW_MENU] =
	          g_signal_new ("show-menu",
        		        G_OBJECT_CLASS_TYPE (klass),
                    		G_SIGNAL_RUN_FIRST,
                                G_STRUCT_OFFSET (EvNavigationActionWidgetClass, show_menu),
                                NULL, NULL,
                                g_cclosure_marshal_VOID__VOID,
                                G_TYPE_NONE, 0);
}

static int
menu_deactivate_cb (GtkMenuShell      *menu_shell,
		    EvNavigationActionWidget *widget)
{
         gtk_toggle_tool_button_set_active (GTK_TOGGLE_TOOL_BUTTON (widget), FALSE);
	 return TRUE;
}

static void
menu_detacher (GtkWidget *widget,
               GtkMenu   *menu)
{
	 EvNavigationActionWidget *button = EV_NAVIGATION_ACTION_WIDGET (widget);
         g_return_if_fail (button->menu == menu);
	 button->menu = NULL;
}

void
ev_navigation_action_widget_set_menu(EvNavigationActionWidget *button, GtkWidget *menu)
{

      if (button->menu == GTK_MENU (menu))
		return;

      if (button->menu && gtk_widget_get_visible (GTK_WIDGET (button->menu)))
	        gtk_menu_shell_deactivate (GTK_MENU_SHELL (button->menu));

      if (button->menu) {
    		g_signal_handlers_disconnect_by_func (button->menu,
						menu_deactivate_cb,
						button);
		gtk_menu_detach (button->menu);
       }

       button->menu = GTK_MENU (menu);

       if (button->menu) {
    		gtk_menu_attach_to_widget (button->menu, GTK_WIDGET (button),
            		                   menu_detacher);
		g_signal_connect (button->menu, "deactivate",
				  G_CALLBACK (menu_deactivate_cb), button);
	}
}

static void
popup_menu_under_arrow (EvNavigationActionWidget *button,
                        GdkEventButton    *event)
{
	g_signal_emit (button, signals[SHOW_MENU], 0);

	if (!button->menu)
		return;

	gtk_menu_popup_at_pointer (button->menu,
	                           (const GdkEvent*) event);
}

static void
ev_navigation_action_widget_toggled (GtkToggleToolButton *toggle)
{
	EvNavigationActionWidget *button = EV_NAVIGATION_ACTION_WIDGET (toggle);
	if (!button->menu)
    		return;

	if (gtk_toggle_tool_button_get_active (GTK_TOGGLE_TOOL_BUTTON (button)) &&
	    !gtk_widget_get_visible (GTK_WIDGET (button->menu))) {
		      /* we get here only when the menu is activated by a key
		       * press, so that we can select the first menu item */
		      popup_menu_under_arrow (button, NULL);
		      gtk_menu_shell_select_first (GTK_MENU_SHELL (button->menu), FALSE);
        }
}

static gboolean
ev_navigation_action_widget_button_press_event (GtkWidget *widget,
                	            		GdkEventButton    *event,
                	            		gpointer data)
{
	EvNavigationActionWidget *button = EV_NAVIGATION_ACTION_WIDGET (data);

	if (event->button == 1) {
	         popup_menu_under_arrow (button, event);
	    	 gtk_toggle_tool_button_set_active (GTK_TOGGLE_TOOL_BUTTON (button), TRUE);
	    	 return TRUE;
	}
	return FALSE;
}
