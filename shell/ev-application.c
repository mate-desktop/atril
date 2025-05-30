/* this file is part of atril, a mate document viewer
 *
 *  Copyright (C) 2004 Martin Kretzschmar
 *  Copyright © 2010, 2012 Christian Persch
 *
 *  Author:
 *    Martin Kretzschmar <martink@gnome.org>
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

#include <config.h>
#include <stdlib.h>
#include <string.h>

#include <glib.h>
#include <glib/gi18n.h>
#include <glib/gstdio.h>
#include <gtk/gtk.h>
#include <gdk/gdkx.h>

#include "eggsmclient.h"

#include "ev-application.h"
#include "ev-file-helpers.h"
#include "ev-stock-icons.h"

#ifdef ENABLE_DBUS
#include "ev-gdbus-generated.h"
#include "ev-media-player-keys.h"
#endif /* ENABLE_DBUS */

struct _EvApplication {
	GtkApplication base_instance;

	gchar *uri;

	gchar *dot_dir;

#ifdef ENABLE_DBUS
	EvAtrilApplication *skeleton;
	EvMediaPlayerKeys *keys;
	gboolean doc_registered;
#endif

	EggSMClient *smclient;
};

struct _EvApplicationClass {
	GtkApplicationClass base_class;
};

G_DEFINE_TYPE (EvApplication, ev_application, GTK_TYPE_APPLICATION)

#ifdef ENABLE_DBUS
#define APPLICATION_DBUS_OBJECT_PATH "/org/mate/atril/Atril"
#define APPLICATION_DBUS_INTERFACE   "org.mate.atril.Application"

#define ATRIL_DAEMON_SERVICE        "org.mate.atril.Daemon"
#define ATRIL_DAEMON_OBJECT_PATH    "/org/mate/atril/Daemon"
#define ATRIL_DAEMON_INTERFACE      "org.mate.atril.Daemon"
#endif

static const gchar *userdir = NULL;

static void _ev_application_open_uri_at_dest (EvApplication  *application,
					      const gchar    *uri,
					      GdkScreen      *screen,
					      EvLinkDest     *dest,
					      EvWindowRunMode mode,
					      const gchar    *search_string,
					      guint           timestamp);
static void ev_application_open_uri_in_window (EvApplication  *application,
					       const char     *uri,
					       EvWindow       *ev_window,
					       GdkScreen      *screen,
					       EvLinkDest     *dest,
					       EvWindowRunMode mode,
					       const gchar    *search_string,
					       guint           timestamp);

/**
 * ev_application_new:
 *
 * Creates a new #EvApplication instance.
 *
 * Returns: (transfer full): a newly created #EvApplication
 */
EvApplication *
ev_application_new (void)
{
  const GApplicationFlags flags = G_APPLICATION_NON_UNIQUE;

  return g_object_new (EV_TYPE_APPLICATION,
                       "application-id", NULL,
                       "flags", flags,
                       NULL);
}

/* Session */
gboolean
ev_application_load_session (EvApplication *application)
{
	GKeyFile *state_file;
	gchar    *uri;

	if (egg_sm_client_is_resumed (application->smclient)) {
		state_file = egg_sm_client_get_state_file (application->smclient);
		if (!state_file)
			return FALSE;
	} else
		return FALSE;

	uri = g_key_file_get_string (state_file, "Atril", "uri", NULL);
	if (!uri)
		return FALSE;

	ev_application_open_uri_at_dest (application, uri,
					 gdk_screen_get_default (),
					 NULL, 0, NULL,
					 GDK_CURRENT_TIME);
	g_free (uri);
	g_key_file_free (state_file);

	return TRUE;
}

static void
smclient_save_state_cb (EggSMClient   *client,
			GKeyFile      *state_file,
			EvApplication *application)
{
	if (!application->uri)
		return;

	g_key_file_set_string (state_file, "Atril", "uri", application->uri);
}

static void
smclient_quit_cb (EggSMClient  *client,
                  GApplication *application)
{
        g_application_quit (application);
}

static void
ev_application_init_session (EvApplication *application)
{
	application->smclient = egg_sm_client_get ();
	g_signal_connect (application->smclient, "save_state",
			  G_CALLBACK (smclient_save_state_cb),
			  application);
	g_signal_connect (application->smclient, "quit",
			  G_CALLBACK (smclient_quit_cb),
			  application);
}

/**
 * ev_display_open_if_needed:
 * @name: the name of the display to be open if it's needed.
 *
 * Search among all the open displays if any of them have the same name as the
 * passed name. If the display isn't found it tries the open it.
 *
 * Returns: a #GdkDisplay of the display with the passed name.
 */
static GdkDisplay *
ev_display_open_if_needed (const gchar *name)
{
	GSList     *displays;
	GSList     *l;
	GdkDisplay *display = NULL;

	displays = gdk_display_manager_list_displays (gdk_display_manager_get ());

	for (l = displays; l != NULL; l = l->next) {
		const gchar *display_name = gdk_display_get_name ((GdkDisplay *) l->data);

		if (g_ascii_strcasecmp (display_name, name) == 0) {
			display = l->data;
			break;
		}
	}

	g_slist_free (displays);

	return display != NULL ? display : gdk_display_open (name);
}

static void
ev_spawn (const char     *uri,
	  GdkScreen      *screen,
	  EvLinkDest     *dest,
	  EvWindowRunMode mode,
	  const gchar    *search_string,
	  guint           timestamp)
{
	GString *cmd;
	gchar *path, *cmdline;
	GAppInfo *app;
	GdkAppLaunchContext *ctx;
	GError  *error = NULL;

	cmd = g_string_new (NULL);
	path = g_build_filename (BINDIR, "atril", NULL);
	g_string_append_printf (cmd, " %s", path);
	g_free (path);

	/* Page label or index */
	if (dest) {
		switch (ev_link_dest_get_dest_type (dest)) {
		case EV_LINK_DEST_TYPE_PAGE_LABEL:
			g_string_append_printf (cmd, " --page-label=%s",
			                        ev_link_dest_get_page_label (dest));
			break;
		case EV_LINK_DEST_TYPE_PAGE:
			g_string_append_printf (cmd, " --page-index=%d",
			                        ev_link_dest_get_page (dest) + 1);
			break;
		case EV_LINK_DEST_TYPE_NAMED:
		g_string_append_printf (cmd, " --named-dest=%s",
			                    ev_link_dest_get_named_dest (dest));
			break;
		default:
			break;
		}
	}

	/* Find string */
	if (search_string) {
		g_string_append_printf (cmd, " --find=%s", search_string);
	}

	/* Mode */
	switch (mode) {
	case EV_WINDOW_MODE_FULLSCREEN:
		g_string_append (cmd, " -f");
		break;
	case EV_WINDOW_MODE_PRESENTATION:
		g_string_append (cmd, " -s");
		break;
	default:
		break;
	}

	cmdline = g_string_free (cmd, FALSE);
	app = g_app_info_create_from_commandline (cmdline, NULL, G_APP_INFO_CREATE_SUPPORTS_URIS, &error);

	if (app != NULL) {
		GList uri_list;
		GList *uris = NULL;

		ctx = gdk_display_get_app_launch_context (gdk_screen_get_display (screen));
		gdk_app_launch_context_set_screen (ctx, screen);
		gdk_app_launch_context_set_timestamp (ctx, timestamp);

		if (uri) {
			uri_list.data = (gchar *)uri;
			uri_list.prev = uri_list.next = NULL;
			uris = &uri_list;
		}
		g_app_info_launch_uris (app, uris, G_APP_LAUNCH_CONTEXT (ctx), &error);

		g_object_unref (app);
		g_object_unref (ctx);
	}
	if (error != NULL) {
		g_printerr ("Error launching atril %s: %s\n", uri, error->message);
		g_error_free (error);
	}

	g_free (cmdline);
}

static EvWindow *
ev_application_get_empty_window (EvApplication *application,
				 GdkScreen     *screen)
{
	EvWindow *empty_window = NULL;
	GList    *windows, *l;

        windows = gtk_application_get_windows (GTK_APPLICATION (application));
	for (l = windows; l != NULL; l = l->next) {
		EvWindow *window;

                if (!EV_IS_WINDOW (l->data))
                          continue;

                window = EV_WINDOW (l->data);

		if (ev_window_is_empty (window) &&
		    gtk_window_get_screen (GTK_WINDOW (window)) == screen) {
			empty_window = window;
			break;
		}
	}

	return empty_window;
}

#ifdef ENABLE_DBUS
typedef struct {
	gchar          *uri;
	GdkScreen      *screen;
	EvLinkDest     *dest;
	EvWindowRunMode mode;
	gchar          *search_string;
	guint           timestamp;
} EvRegisterDocData;

static void
ev_register_doc_data_free (EvRegisterDocData *data)
{
	if (!data)
		return;

	g_free (data->uri);
	if (data->search_string)
		g_free (data->search_string);
	if (data->dest)
		g_object_unref (data->dest);

	g_free (data);
}

static void
on_reload_cb (GObject      *source_object,
	      GAsyncResult *res,
	      gpointer      user_data)
{
	GDBusConnection *connection = G_DBUS_CONNECTION (source_object);
	GVariant        *value;
	GError          *error = NULL;

	g_application_release (g_application_get_default ());

	value = g_dbus_connection_call_finish (connection, res, &error);
	if (value != NULL) {
                g_variant_unref (value);
        } else {
		g_printerr ("Failed to Reload: %s\n", error->message);
		g_error_free (error);
	}

	/* We did not open a window, so manually clear the startup
	 * notification. */
	gdk_notify_startup_complete ();
}

static void
on_register_uri_cb (GObject      *source_object,
		    GAsyncResult *res,
		    gpointer      user_data)
{
	GDBusConnection   *connection = G_DBUS_CONNECTION (source_object);
	EvRegisterDocData *data = (EvRegisterDocData *)user_data;
	EvApplication     *application = EV_APP;
	GVariant          *value;
	const gchar       *owner;
	GVariantBuilder    builder;
	GError            *error = NULL;

	g_application_release (G_APPLICATION (application));

	value = g_dbus_connection_call_finish (connection, res, &error);
	if (!value) {
		g_printerr ("Error registering document: %s\n", error->message);
		g_error_free (error);

		_ev_application_open_uri_at_dest (application,
						  data->uri,
						  data->screen,
						  data->dest,
						  data->mode,
						  data->search_string,
						  data->timestamp);
		ev_register_doc_data_free (data);

		return;
	}

	g_variant_get (value, "(&s)", &owner);

	/* This means that the document wasn't already registered; go
	 * ahead with opening it.
	 */
	if (owner[0] == '\0') {
		g_variant_unref (value);

		application->doc_registered = TRUE;

		_ev_application_open_uri_at_dest (application,
						  data->uri,
						  data->screen,
						  data->dest,
						  data->mode,
						  data->search_string,
						  data->timestamp);
		ev_register_doc_data_free (data);

		return;
	}

	/* Already registered */
	g_variant_builder_init (&builder, G_VARIANT_TYPE ("(a{sv}u)"));
	g_variant_builder_open (&builder, G_VARIANT_TYPE ("a{sv}"));
	g_variant_builder_add (&builder, "{sv}",
	                       "display",
	                       g_variant_new_string (gdk_display_get_name (gdk_screen_get_display (data->screen))));

	if (GDK_IS_X11_SCREEN (data->screen)) {
		g_variant_builder_add (&builder, "{sv}",
		                     "screen",
		                      g_variant_new_int32 (gdk_x11_screen_get_screen_number (data->screen)));
	} else {
		/*Do not crash on wayland, use the first monitor for now*/
		g_variant_builder_add (&builder, "{sv}",
		                     "screen",
		                      g_variant_new_int32 (0));
	}
	if (data->dest) {
		switch (ev_link_dest_get_dest_type (data->dest)) {
		case EV_LINK_DEST_TYPE_PAGE_LABEL:
			g_variant_builder_add (&builder, "{sv}", "page-label",
			                       g_variant_new_string (ev_link_dest_get_page_label (data->dest)));
			break;
		case EV_LINK_DEST_TYPE_PAGE:
			g_variant_builder_add (&builder, "{sv}", "page-index",
			                       g_variant_new_uint32 (ev_link_dest_get_page (data->dest)));
			break;
		case EV_LINK_DEST_TYPE_NAMED:
			g_variant_builder_add (&builder, "{sv}", "named-dest",
			                       g_variant_new_string (ev_link_dest_get_named_dest (data->dest)));
			break;
		default:
			break;
		}
	}
	if (data->search_string) {
		g_variant_builder_add (&builder, "{sv}",
		                       "find-string",
		                       g_variant_new_string (data->search_string));
	}
	if (data->mode != EV_WINDOW_MODE_NORMAL) {
		g_variant_builder_add (&builder, "{sv}",
		                       "mode",
		                       g_variant_new_uint32 (data->mode));
	}
	g_variant_builder_close (&builder);

	g_variant_builder_add (&builder, "u", data->timestamp);

	g_dbus_connection_call (connection,
				owner,
				APPLICATION_DBUS_OBJECT_PATH,
				APPLICATION_DBUS_INTERFACE,
				"Reload",
				g_variant_builder_end (&builder),
				NULL,
				G_DBUS_CALL_FLAGS_NONE,
				-1,
				NULL,
				on_reload_cb,
				NULL);
        g_application_hold (G_APPLICATION (application));
	g_variant_unref (value);
	ev_register_doc_data_free (data);
}

/*
 * ev_application_register_uri:
 * @application:
 * @uri:
 * @screen:
 * @dest:
 * @mode:
 * @search_string:
 * @timestamp:
 *
 * Registers @uri with atril-daemon.
 *
 */
static void
ev_application_register_uri (EvApplication  *application,
			     const gchar    *uri,
                             GdkScreen      *screen,
                             EvLinkDest     *dest,
                             EvWindowRunMode mode,
                             const gchar    *search_string,
			     guint           timestamp)
{
	EvRegisterDocData *data;

	if (!application->skeleton)
		return;

	if (application->doc_registered) {
		/* Already registered, reload */
		GList *windows, *l;

		windows = gtk_application_get_windows (GTK_APPLICATION (application));
		for (l = windows; l != NULL; l = g_list_next (l)) {
                        if (!EV_IS_WINDOW (l->data))
                                continue;

			ev_application_open_uri_in_window (application, uri,
                                                           EV_WINDOW (l->data),
							   screen, dest, mode,
							   search_string,
							   timestamp);
		}

		return;
	}

	data = g_new (EvRegisterDocData, 1);
	data->uri = g_strdup (uri);
	data->screen = screen;
	data->dest = dest ? g_object_ref (dest) : NULL;
	data->mode = mode;
	data->search_string = search_string ? g_strdup (search_string) : NULL;
	data->timestamp = timestamp;

        g_dbus_connection_call (g_application_get_dbus_connection (G_APPLICATION (application)),
				ATRIL_DAEMON_SERVICE,
				ATRIL_DAEMON_OBJECT_PATH,
				ATRIL_DAEMON_INTERFACE,
				"RegisterDocument",
				g_variant_new ("(s)", uri),
				G_VARIANT_TYPE ("(s)"),
				G_DBUS_CALL_FLAGS_NONE,
				-1,
				NULL,
				on_register_uri_cb,
				data);

        g_application_hold (G_APPLICATION (application));
}

static void
ev_application_unregister_uri (EvApplication *application,
			       const gchar   *uri)
{
        GVariant *value;
	GError   *error = NULL;

	if (!application->doc_registered)
		return;

	/* This is called from ev_application_shutdown(),
	 * so it's safe to use the sync api
	 */
        value = g_dbus_connection_call_sync (
		g_application_get_dbus_connection (G_APPLICATION (application)),
		ATRIL_DAEMON_SERVICE,
		ATRIL_DAEMON_OBJECT_PATH,
		ATRIL_DAEMON_INTERFACE,
		"UnregisterDocument",
		g_variant_new ("(s)", uri),
		NULL,
		G_DBUS_CALL_FLAGS_NO_AUTO_START,
		-1,
		NULL,
		&error);
        if (value == NULL) {
		g_printerr ("Error unregistering document: %s\n", error->message);
		g_error_free (error);
	} else {
                g_variant_unref (value);
	}
}
#endif /* ENABLE_DBUS */

static void
ev_application_open_uri_in_window (EvApplication  *application,
				   const char     *uri,
				   EvWindow       *ev_window,
				   GdkScreen      *screen,
				   EvLinkDest     *dest,
				   EvWindowRunMode mode,
				   const gchar    *search_string,
				   guint           timestamp)
{
	GdkWindow *gdk_window;

	if (uri == NULL)
	        uri = application->uri;

	if (screen) {
		ev_stock_icons_set_screen (screen);
		gtk_window_set_screen (GTK_WINDOW (ev_window), screen);
	}

	/* We need to load uri before showing the window, so
	   we can restore window size without flickering */
	ev_window_open_uri (ev_window, uri, dest, mode, search_string);

	if (!gtk_widget_get_realized (GTK_WIDGET (ev_window)))
		gtk_widget_realize (GTK_WIDGET (ev_window));

	gdk_window = gtk_widget_get_window (GTK_WIDGET (ev_window));

	if (GDK_IS_X11_WINDOW (gdk_window)) {
		if (timestamp <= 0)
			timestamp = gdk_x11_get_server_time (gdk_window);
		gdk_x11_window_set_user_time (gdk_window, timestamp);
	}

	gtk_window_present (GTK_WINDOW (ev_window));
}

static void
_ev_application_open_uri_at_dest (EvApplication  *application,
				  const gchar    *uri,
				  GdkScreen      *screen,
				  EvLinkDest     *dest,
				  EvWindowRunMode mode,
				  const gchar    *search_string,
				  guint           timestamp)
{
	EvWindow *ev_window;

	ev_window = ev_application_get_empty_window (application, screen);
	if (!ev_window)
		ev_window = EV_WINDOW (ev_window_new ());

	ev_application_open_uri_in_window (application, uri, ev_window,
					   screen, dest, mode,
					   search_string,
					   timestamp);
}

/**
 * ev_application_open_uri_at_dest:
 * @application: The instance of the application.
 * @uri: The uri to be opened.
 * @screen: Thee screen where the link will be shown.
 * @dest: The #EvLinkDest of the document.
 * @mode: The run mode of the window.
 * @timestamp: Current time value.
 */
void
ev_application_open_uri_at_dest (EvApplication  *application,
				 const char     *uri,
				 GdkScreen      *screen,
				 EvLinkDest     *dest,
				 EvWindowRunMode mode,
				 const gchar    *search_string,
				 guint           timestamp)
{
	g_return_if_fail (uri != NULL);

	if (application->uri && strcmp (application->uri, uri) != 0) {
		/* spawn a new atril process */
		ev_spawn (uri, screen, dest, mode, search_string, timestamp);
		return;
	} else if (!application->uri) {
		application->uri = g_strdup (uri);
	}

#ifdef ENABLE_DBUS
	/* Register the uri or send Reload to
	 * remote instance if already registered
	 */
	ev_application_register_uri (application, uri, screen, dest, mode, search_string, timestamp);
#else
	_ev_application_open_uri_at_dest (application, uri, screen, dest, mode, search_string, timestamp);
#endif /* ENABLE_DBUS */
}

/**
 * ev_application_open_window:
 * @application: The instance of the application.
 * @timestamp: Current time value.
 *
 * Creates a new window
 */
void
ev_application_open_window (EvApplication *application,
			    GdkScreen     *screen,
			    guint32        timestamp)
{
	GtkWidget *new_window = ev_window_new ();
	GdkWindow *gdk_window;

	if (screen) {
		ev_stock_icons_set_screen (screen);
		gtk_window_set_screen (GTK_WINDOW (new_window), screen);
	}

	if (!gtk_widget_get_realized (new_window))
		gtk_widget_realize (new_window);

	gdk_window = gtk_widget_get_window (GTK_WIDGET (new_window));

	if (GDK_IS_X11_WINDOW (gdk_window)) {
		if (timestamp <= 0)
			timestamp = gdk_x11_get_server_time (gdk_window);
		gdk_x11_window_set_user_time (gdk_window, timestamp);
	}

	gtk_window_present (GTK_WINDOW (new_window));
}

#ifdef ENABLE_DBUS
static gboolean
handle_get_window_list_cb (EvAtrilApplication    *object,
                           GDBusMethodInvocation *invocation,
                           EvApplication         *application)
{
        GList     *windows, *l;
        GPtrArray *paths;

        paths = g_ptr_array_new ();

        windows = gtk_application_get_windows (GTK_APPLICATION (application));
        for (l = windows; l; l = g_list_next (l)) {
                if (!EV_IS_WINDOW (l->data))
                        continue;

                g_ptr_array_add (paths, (gpointer) ev_window_get_dbus_object_path (EV_WINDOW (l->data)));
        }

        g_ptr_array_add (paths, NULL);
        ev_atril_application_complete_get_window_list (object, invocation,
                                                        (const char * const *) paths->pdata);

        g_ptr_array_free (paths, TRUE);

        return TRUE;
}

static gboolean
handle_reload_cb (EvAtrilApplication   *object,
                  GDBusMethodInvocation *invocation,
                  GVariant              *args,
                  guint                  timestamp,
                  EvApplication         *application)
{
        GList           *windows, *l;
        GVariantIter     iter;
        const gchar     *key;
        GVariant        *value;
        GdkDisplay      *display = NULL;
        EvLinkDest      *dest = NULL;
        EvWindowRunMode  mode = EV_WINDOW_MODE_NORMAL;
        const gchar     *search_string = NULL;
        GdkScreen       *screen = NULL;

        g_variant_iter_init (&iter, args);

        while (g_variant_iter_loop (&iter, "{&sv}", &key, &value)) {
                if (strcmp (key, "display") == 0 && g_variant_classify (value) == G_VARIANT_CLASS_STRING) {
                        display = ev_display_open_if_needed (g_variant_get_string (value, NULL));
                } else if (strcmp (key, "mode") == 0 && g_variant_classify (value) == G_VARIANT_CLASS_UINT32) {
                        mode = g_variant_get_uint32 (value);
                } else if (strcmp (key, "page-label") == 0 && g_variant_classify (value) == G_VARIANT_CLASS_STRING) {
                        dest = ev_link_dest_new_page_label (g_variant_get_string (value, NULL));
                } else if (strcmp (key, "named-dest") == 0 && g_variant_classify (value) == G_VARIANT_CLASS_STRING) {
                        dest = ev_link_dest_new_named (g_variant_get_string (value, NULL));
                } else if (strcmp (key, "page-index") == 0 && g_variant_classify (value) == G_VARIANT_CLASS_UINT32) {
                        dest = ev_link_dest_new_page (g_variant_get_uint32 (value));
                } else if (strcmp (key, "find-string") == 0 && g_variant_classify (value) == G_VARIANT_CLASS_STRING) {
                        search_string = g_variant_get_string (value, NULL);
                }
        }

        if (display != NULL)
                screen = gdk_display_get_default_screen (display);
        else
                screen = gdk_screen_get_default ();

        windows = gtk_application_get_windows (GTK_APPLICATION ((application)));
        for (l = windows; l != NULL; l = g_list_next (l)) {
                if (!EV_IS_WINDOW (l->data))
                        continue;

                ev_application_open_uri_in_window (application, NULL,
                                                   EV_WINDOW (l->data),
                                                   screen, dest, mode,
                                                   search_string,
                                                   timestamp);
        }

        if (dest)
                g_object_unref (dest);

        ev_atril_application_complete_reload (object, invocation);

        return TRUE;
}
#endif /* ENABLE_DBUS */

void
ev_application_open_uri_list (EvApplication *application,
			      GSList        *uri_list,
			      GdkScreen     *screen,
			      guint          timestamp)
{
	GSList *l;

	for (l = uri_list; l != NULL; l = l->next) {
		ev_application_open_uri_at_dest (application, (char *)l->data,
						 screen, NULL, 0, NULL,
						 timestamp);
	}
}

static void ev_application_accel_map_save(EvApplication* application)
{
	gchar* accel_map_file;
	gchar* tmp_filename;
	gint fd;

	if (userdir)
	{
		accel_map_file = g_build_filename(userdir, "atril", "accels", NULL);
	}
	else
	{
		accel_map_file = g_build_filename(g_get_user_config_dir(), "accels", "atril", NULL);
	}

	tmp_filename = g_strdup_printf("%s.XXXXXX", accel_map_file);

	fd = g_mkstemp(tmp_filename);

	if (fd == -1)
	{
		g_free(accel_map_file);
		g_free(tmp_filename);

		return;
	}

	gtk_accel_map_save_fd(fd);
	close(fd);

	if (g_rename(tmp_filename, accel_map_file) == -1)
	{
		g_unlink(tmp_filename);
	}

	g_free(accel_map_file);
	g_free(tmp_filename);
}

static void ev_application_accel_map_load(EvApplication* application)
{
	gchar* accel_map_file;

	if (userdir)
	{
		accel_map_file = g_build_filename(userdir, "accels", "atril", NULL);
	}
	else
	{
		accel_map_file = g_build_filename(g_get_user_config_dir(), "atril", "accels", NULL);
	}

	gtk_accel_map_load(accel_map_file);
	g_free(accel_map_file);
}

static void
ev_application_shutdown (GApplication *gapplication)
{
        EvApplication *application = EV_APPLICATION (gapplication);

	if (application->uri) {
#ifdef ENABLE_DBUS
		ev_application_unregister_uri (application,
					       application->uri);
#endif
		g_free (application->uri);
		application->uri = NULL;
	}

	ev_application_accel_map_save (application);

        g_free (application->dot_dir);
        application->dot_dir = NULL;

        G_APPLICATION_CLASS (ev_application_parent_class)->shutdown (gapplication);
}

static void
ev_application_activate (GApplication *gapplication)
{
        EvApplication *application = EV_APPLICATION (gapplication);
        GList *windows, *l;

        windows = gtk_application_get_windows (GTK_APPLICATION (application));
        for (l = windows; l != NULL; l = l->next) {
                if (!EV_IS_WINDOW (l->data))
                        continue;

                gtk_window_present (GTK_WINDOW (l->data));
        }
}

#ifdef ENABLE_DBUS
static gboolean
ev_application_dbus_register (GApplication    *gapplication,
                              GDBusConnection *connection,
                              const gchar     *object_path,
                              GError         **error)
{
        EvApplication *application = EV_APPLICATION (gapplication);
        EvAtrilApplication *skeleton;

        if (!G_APPLICATION_CLASS (ev_application_parent_class)->dbus_register (gapplication,
                                                                               connection,
                                                                               object_path,
                                                                               error))
                return FALSE;

        skeleton = ev_atril_application_skeleton_new ();
        if (!g_dbus_interface_skeleton_export (G_DBUS_INTERFACE_SKELETON (skeleton),
                                               connection,
                                               APPLICATION_DBUS_OBJECT_PATH,
                                               error)) {
                g_object_unref (skeleton);

                return FALSE;
        }

        application->skeleton = skeleton;
        g_signal_connect (skeleton, "handle-get-window-list",
                          G_CALLBACK (handle_get_window_list_cb),
                          application);
        g_signal_connect (skeleton, "handle-reload",
                          G_CALLBACK (handle_reload_cb),
                          application);
        application->keys = ev_media_player_keys_new ();

        return TRUE;
}

static void
ev_application_dbus_unregister (GApplication    *gapplication,
                                GDBusConnection *connection,
                                const gchar     *object_path)
{
        EvApplication *application = EV_APPLICATION (gapplication);

        if (application->keys) {
                g_object_unref (application->keys);
                application->keys = NULL;
        }
        if (application->skeleton != NULL) {
                g_dbus_interface_skeleton_unexport (G_DBUS_INTERFACE_SKELETON (application->skeleton));
                g_object_unref (application->skeleton);
                application->skeleton = NULL;
        }

        G_APPLICATION_CLASS (ev_application_parent_class)->dbus_unregister (gapplication,
                                                                            connection,
                                                                            object_path);
}

#endif /* ENABLE_DBUS */

static void ev_application_class_init(EvApplicationClass* ev_application_class)
{
        GApplicationClass *g_application_class = G_APPLICATION_CLASS (ev_application_class);

        g_application_class->activate = ev_application_activate;
        g_application_class->shutdown = ev_application_shutdown;

#ifdef ENABLE_DBUS
        g_application_class->dbus_register = ev_application_dbus_register;
        g_application_class->dbus_unregister = ev_application_dbus_unregister;
#endif
}

static void ev_application_init(EvApplication* ev_application)
{
	userdir = g_getenv("MATE22_USER_DIR");

	if (userdir)
	{
		ev_application->dot_dir = g_build_filename(userdir, "atril", NULL);
	}
	else
	{
		ev_application->dot_dir = g_build_filename(g_get_user_config_dir(), "atril", NULL);
	}

	ev_application_init_session (ev_application);

	ev_application_accel_map_load (ev_application);
}

gboolean
ev_application_has_window (EvApplication *application)
{
	GList *l, *windows;

	windows = gtk_application_get_windows (GTK_APPLICATION (application));
	for (l = windows; l != NULL; l = l->next) {
		if (!EV_IS_WINDOW (l->data))
                        continue;

                return TRUE;
	}

	return FALSE;
}

guint
ev_application_get_n_windows (EvApplication *application)
{
        GList *l, *windows;
        guint retval = 0;

        windows = gtk_application_get_windows (GTK_APPLICATION (application));
        for (l = windows; l != NULL && !retval; l = l->next) {
                if (!EV_IS_WINDOW (l->data))
                        continue;

                retval++;
	}

	return retval;
}

const gchar *
ev_application_get_uri (EvApplication *application)
{
	return application->uri;
}

/**
 * ev_application_get_media_keys:
 * @application: The instance of the application.
 *
 * It gives you access to the media player keys handler object.
 *
 * Returns: A #EvMediaPlayerKeys.
 */
GObject *
ev_application_get_media_keys (EvApplication *application)
{
#ifdef ENABLE_DBUS
	return G_OBJECT (application->keys);
#else
	return NULL;
#endif /* ENABLE_DBUS */
}

const gchar *
ev_application_get_dot_dir (EvApplication *application,
                            gboolean create)
{
        if (create)
                g_mkdir_with_parents (application->dot_dir, 0700);

	return application->dot_dir;
}
