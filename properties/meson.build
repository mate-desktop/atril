glib_dep = dependency('glib-2.0')
properties_inc = include_directories('.', '..')

libevproperties_sources = [
    'ev-properties-view.c',
    'ev-properties-view.h',
]

libevproperties = static_library(
    'evproperties',
    libevproperties_sources,
    include_directories: properties_inc,
    dependencies: [glib_dep, gtk]
)

libevproperties_dep = declare_dependency(
    link_with: libevproperties,
    include_directories: properties_inc,
    dependencies: [glib_dep, gtk]
)

gtk_x11 = dependency('gtk+-x11-' + gtk_api_version, required: get_option('caja'))
caja_extension = dependency('libcaja-extension', version: '>= 1.17.1', required: get_option('caja'))
if gtk_x11.found() and caja_extension.found()
    shared_module(
        'atril-properties-page',
        ['ev-properties-main.c'],
        include_directories: include_dirs,
        dependencies: [gtk_x11, caja_extension, libdocument_dep, libevproperties_dep],
        install: true,
        install_dir: caja_extension.get_variable(pkgconfig: 'extensiondir')
    )

    caja_ext_conf = configuration_data()
    caja_ext_conf.set('VERSION', meson.project_version())
    caja_ext_conf.set('PACKAGE_URL', 'https://mate-desktop.org')

    caja_ext = configure_file(
        input: 'libatril-properties-page.caja-extension.desktop.in.in',
        output: 'libatril-properties-page.caja-extension.desktop.in',
        configuration: caja_ext_conf,
    )

    i18n.merge_file(
      input: caja_ext,
      output: 'libatril-properties-page.caja-extension',
      type: 'desktop',
      po_dir: po_dir,
      install: true,
      install_dir: join_paths(datadir, 'caja', 'extensions'),
    )
endif
