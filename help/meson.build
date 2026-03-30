# developer docs
if get_option('docs')
    glib_prefix = glib.get_pkgconfig_variable('prefix')
    gtk_prefix = gtk.get_pkgconfig_variable('prefix')

    fixref_args = [
        '--extra-dir=' + join_paths(glib_prefix, gnome.gtkdoc_html_dir('glib')),
        '--extra-dir=' + join_paths(glib_prefix, gnome.gtkdoc_html_dir('gio')),
        '--extra-dir=' + join_paths(gtk_prefix, gnome.gtkdoc_html_dir('gdk')),
        '--extra-dir=' + join_paths(gtk_prefix, gnome.gtkdoc_html_dir('gdk-pixbuf')),
        '--extra-dir=' + join_paths(gtk_prefix, gnome.gtkdoc_html_dir('gtk')),
    ]

    subdir('reference/libdocument')
    subdir('reference/libview')
    subdir('reference/shell')
endif

# help files
if get_option('help_files')
  help_sources = [
      'annotation-properties.page',
      'annotations-delete.page',
      'annotations-disabled.page',
      'annotations-navigate.page',
      'annotations.page',
      'annotations-save.page',
      'bookmarks.page',
      'bug-filing.page',
      'commandline.page',
      'convertpdf.page',
      'convertPostScript.page',
      'convertSVG.page',
      'default-settings.page',
      'develop.page',
      'documentation.page',
      'duplex-npages.page',
      'editing.page',
      'finding.page',
      'formats.page',
      'forms.page',
      'forms-saving.page',
      'index.page',
      'introduction.page',
      'invert-colors.page',
      'legal.xml',
      'legal-unported.xml',
      'license.page',
      'movingaround.page',
      'noprint.page',
      'openerror.page',
      'opening.page',
      'password.page',
      'presentations.page',
      'print-2sided.page',
      'print-booklet.page',
      'print-differentsize.page',
      'printing.page',
      'print-pagescaling.page',
      'reload.page',
      'shortcuts.page',
      'singlesided-npages.page',
      'synctex-beamer.page',
      'synctex-compile.page',
      'synctex-editors.page',
      'synctex.page',
      'synctex-search.page',
      'synctex-support.page',
      'textselection.page',
      'translate.page',
  ]

  help_media = [
      'figures/atril.png',
      'figures/atril-trail.png',
  ]

  gnome.yelp(
      meson.project_name(),
      sources: help_sources,
      media: help_media,
  )
endif
