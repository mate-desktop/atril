djvu_sources = [
    'djvu-document.c',
    'djvu-document.h',
    'djvu-document-private.h',
    'djvu-links.c',
    'djvu-links.h',
    'djvu-text-page.c',
    'djvu-text-page.h',
]

djvu_deps = [
    cairo,
    djvu,
    glib,
    gtk
]

shared_module(
    'djvudocument',
    djvu_sources,
    link_with: [libdocument],
    link_args: ['-Wl,-Bsymbolic', '-Wl,-z,relro', '-Wl,-z,now'],
    include_directories: include_dirs,
    dependencies: djvu_deps,
    install: true,
    install_dir: backendsdir,
)

i18n.merge_file(
  input: 'djvudocument.atril-backend.desktop.in',
  output: 'djvudocument.atril-backend',
  type: 'desktop',
  po_dir: po_dir,
  install: true,
  install_dir: backendsdir,
)
