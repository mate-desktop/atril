libview_private_headers = [
    'ev-annotation-window.h',
    'ev-link-accessible.h',
    'ev-page-accessible.h',
    'ev-image-accessible.h',
    'ev-form-field-accessible.h',
    'ev-page-cache.h',
    'ev-pixbuf-cache.h',
    'ev-timeline.h',
    'ev-transition-animation.h',
    'ev-view-accessible.h',
    'ev-view-cursor.h',
    'ev-view-private.h',
]

libview_headers = [
    'ev-document-model.h',
    'ev-jobs.h',
    'ev-job-scheduler.h',
    'ev-print-operation.h',
    'ev-stock-icons.h',
    'ev-view.h',
    'ev-web-view.h',
    'ev-view-presentation.h',
]

libview_sources = [
    'ev-annotation-window.c',
    'ev-document-model.c',
    'ev-jobs.c',
    'ev-job-scheduler.c',
    'ev-link-accessible.c',
    'ev-page-accessible.c',
    'ev-image-accessible.c',
    'ev-form-field-accessible.c',
    'ev-page-cache.c',
    'ev-pixbuf-cache.c',
    'ev-print-operation.c',
    'ev-stock-icons.c',
    'ev-timeline.c',
    'ev-transition-animation.c',
    'ev-view.c',
    'ev-web-view.c',
    'ev-view-accessible.c',
    'ev-view-cursor.c',
    'ev-view-presentation.c',
    libview_headers,
]

libview_header_dir = join_paths(header_dir, 'libview')

libview_include = include_directories('.')

libview_enums = gnome.mkenums(
    'ev-view-type-builtins',
    sources : libview_headers,
    c_template : 'ev-view-type-builtins.c.template',
    h_template : 'ev-view-type-builtins.h.template',
    identifier_prefix : 'Ev',
    symbol_prefix : 'ev',
    install_header: true,
    install_dir: join_paths(includedir, libview_header_dir),
)

libview_sources += libview_enums

libview_marshal = gnome.genmarshal(
    'ev-view-marshal',
    sources: 'ev-view-marshal.list',
    prefix: 'ev_view_marshal'
)

libview_deps = [
    libdocument_dep,
    config_h,
    gail,
    glib,
    gtk,
    gtk_unix_print,
    math,
]

if get_option('epub')
   libview_deps += webkit
endif

libview = library(
    'view',
    libview_sources + libview_private_headers + libdoc_enums + libview_marshal,
    include_directories: include_dirs,
    dependencies: libview_deps,
    soversion: binary_major_version,
    version: binary_version,
    install: true,
)

libview_dep = declare_dependency(
    link_with: libview,
    include_directories: include_dirs,
    dependencies: libview_deps,
)

install_headers(
    libview_headers,
    subdir: libview_header_dir,
)

if get_option('introspection')
    libview_gir = gnome.generate_gir(
        libview,
        namespace: 'AtrilView',
        nsversion: api_version,
        sources: libview_sources,
        identifier_prefix: 'Ev',
        symbol_prefix: 'ev',
        includes: [introspection_includes, libdocument_gir[0]],
        install: true,
        install_dir_typelib: join_paths(libdir, 'girepository-1.0'),
        install_dir_gir: join_paths(datadir, 'gir-1.0'),
        export_packages: ['libview-' + api_version, 'libdocument-' + api_version],
    )
endif
