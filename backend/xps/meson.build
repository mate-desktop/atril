xps_sources = [
    'xps-document.c',
    'xps-document.h',
]

xps_deps = [
    cairo,
    glib,
    gtk,
    xps,
]

shared_module(
    'xpsdocument',
    xps_sources,
    link_with: [libdocument],
    link_args: ['-Wl,-Bsymbolic', '-Wl,-z,relro', '-Wl,-z,now'],
    include_directories: include_dirs,
    dependencies: xps_deps,
    install: true,
    install_dir: backendsdir,
)

i18n.merge_file(
  input: 'xpsdocument.atril-backend.desktop.in',
  output: 'xpsdocument.atril-backend',
  type: 'desktop',
  po_dir: po_dir,
  install: true,
  install_dir: backendsdir,
)
