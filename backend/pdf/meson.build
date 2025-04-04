pdf_sources = [
    'ev-poppler.cc',
    'ev-poppler.h'
]

pdf_deps = [
    gtk,
    xml,
    poppler,
]

shared_module(
    'pdfdocument',
    pdf_sources,
    link_with: [libdocument],
    link_args: ['-Wl,-Bsymbolic', '-Wl,-z,relro', '-Wl,-z,now'],
    include_directories: include_dirs,
    dependencies: pdf_deps,
    install: true,
    install_dir: backendsdir,
)

i18n.merge_file(
  input: 'pdfdocument.atril-backend.desktop.in',
  output: 'pdfdocument.atril-backend',
  type: 'desktop',
  po_dir: po_dir,
  install: true,
  install_dir: backendsdir,
)
