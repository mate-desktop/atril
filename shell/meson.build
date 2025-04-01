shell_sources = [
    'eggfindbar.c',
    'eggfindbar.h',
    'ev-annotation-properties-dialog.h',
    'ev-annotation-properties-dialog.c',
    'ev-bookmarks.h',
    'ev-bookmarks.c',
    'ev-bookmark-action.h',
    'ev-bookmark-action.c',
    'ev-application.c',
    'ev-application.h',
    'ev-file-monitor.h',
    'ev-file-monitor.c',
    'ev-history.c',
    'ev-history.h',
    'ev-keyring.h',
    'ev-keyring.c',
    'ev-message-area.c',
    'ev-message-area.h',
    'ev-metadata.c',
    'ev-metadata.h',
    'ev-password-view.h',
    'ev-password-view.c',
    'ev-progress-message-area.h',
    'ev-progress-message-area.c',
    'ev-properties-dialog.c',
    'ev-properties-dialog.h',
    'ev-properties-fonts.c',
    'ev-properties-fonts.h',
    'ev-properties-license.c',
    'ev-properties-license.h',
    'ev-open-recent-action.c',
    'ev-open-recent-action.h',
    'ev-utils.c',
    'ev-utils.h',
    'ev-window.c',
    'ev-window.h',
    'ev-window-title.c',
    'ev-window-title.h',
    'ev-sidebar.c',
    'ev-sidebar.h',
    'ev-sidebar-annotations.c',
    'ev-sidebar-annotations.h',
    'ev-sidebar-attachments.c',
    'ev-sidebar-attachments.h',
    'ev-sidebar-bookmarks.h',
    'ev-sidebar-bookmarks.c',
    'ev-sidebar-layers.c',
    'ev-sidebar-layers.h',
    'ev-sidebar-links.c',
    'ev-sidebar-links.h',
    'ev-sidebar-page.c',
    'ev-sidebar-page.h',
    'ev-sidebar-thumbnails.c',
    'ev-sidebar-thumbnails.h',
]

ev_resources = gnome.compile_resources(
    'atril-resources',
    'atril.gresource.xml',
    source_dir: '../data',
    c_name: 'ev',
)

shell_sources += ev_resources

atril_deps = [
    libdocument_dep,
    config_h,
    gio,
    glib,
    gtk,
    libsecret,
    math,
    mate_desktop
]

if get_option('enable_dbus')
    dbus_generated = gnome.gdbus_codegen(
        'ev-gdbus-generated',
        'ev-gdbus.xml',
        interface_prefix: 'org.x.reader',
        namespace: 'Ev',
        object_manager: true,
    )

    dbus_daemon_generated = gnome.gdbus_codegen(
        'ev-daemon-gdbus-generated',
        'ev-daemon-gdbus.xml',
        interface_prefix: 'org.x.reader',
        namespace: 'Ev',
        object_manager: true,
    )

    shell_sources += dbus_generated

    atrild_sources = [
        'ev-daemon.c',
    ]

    atrild_sources += dbus_daemon_generated

    executable(
        'atrild',
        atrild_sources,
        include_directories: include_dirs,
        dependencies: atril_deps,
        install: true,
        install_dir: libexecdir,
    )
endif

libshell_deps = [
    atril_deps,
    libview_dep,
    libmisc_dep,
    mate_submodules_dep,
    libephyzoom_dep,
]

libshell = static_library(
    'shell',
    shell_sources,
    dependencies: libshell_deps,
    include_directories: include_dirs,
)

libshell_dep = declare_dependency(
  link_whole: libshell,  # Need the whole lib for gresource lookup
  dependencies: libshell_deps,
  include_directories: include_dirs,
)

atril = executable(
    'atril',
    'main.c',
    dependencies: libshell_dep,
    install: true,
)
