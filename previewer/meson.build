previewer_sources = [
    'ev-previewer.c',
    'ev-previewer-window.h',
    'ev-previewer-window.c',
    libdoc_enums,
    libview_enums,
]

previewer_sources += gnome.compile_resources(
    'previewer-resources', 'previewer.gresource.xml',
    source_dir: ['.', join_paths(meson.project_source_root(), 'data')],
    c_name: 'ev_previewer'
)

previewer_deps = [
    libdocument_dep,
    gio,
    gtk,
    gtk_unix_print
]

executable(
    'atril-previewer',
    previewer_sources,
    dependencies: previewer_deps,
    link_with: [libview, libmisc],
    include_directories: include_dirs,
    install: true,
)

install_data(
    'atril-previewer.1',
    install_dir : join_paths(prefix, get_option('mandir'), 'man1')
)
