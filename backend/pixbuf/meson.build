pixbuf_sources = [
    'pixbuf-document.c',
    'pixbuf-document.h'
]

pixbuf_deps = [
    cairo,
    glib,
    gtk,
]

shared_module(
    'pixbufdocument',
    pixbuf_sources,
    link_with: [libdocument],
    link_args: ['-Wl,-Bsymbolic', '-Wl,-z,relro', '-Wl,-z,now'],
    include_directories: include_dirs,
    dependencies: pixbuf_deps,
    install: true,
    install_dir: backendsdir,
)

i18n.merge_file(
  input: 'pixbuf.atril-backend.desktop.in',
  output: 'pixbuf.atril-backend',
  type: 'desktop',
  po_dir: po_dir,
  install: true,
  install_dir: backendsdir,
)
