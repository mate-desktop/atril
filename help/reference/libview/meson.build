version_conf = configuration_data()
version_conf.set('VERSION', version)

version_xml = configure_file(
  input: 'version.xml.in',
  output: 'version.xml',
  configuration: version_conf,
)

libview_doc_deps = declare_dependency(
    include_directories: [include_root, libdoc_include, libview_include, include_directories('.')],
    link_with: libview,
    dependencies: libdoc_deps,
)

gnome.gtkdoc(
    'libview',
    mode: 'xml',
    main_xml: 'libview-docs.xml',
    gobject_typesfile: files('libview.types'),
    src_dir: [
        join_paths(meson.source_root(), 'libview'),
    ],
    ignore_headers: [libview_private_headers],
    dependencies: libview_doc_deps,
    mkdb_args: ['--xml-mode', '--output-format=xml', '--name-space=ev'],
    cflags: '-DATRIL_COMPILATION',
    fixxref_args: fixref_args,
    install: true,
    install_dir: 'libview-' + api_version,
)
