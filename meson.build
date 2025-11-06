project('atril', 'c', 'cpp', 
  version: '1.28.2',
  meson_version: '>=0.56.0',
  default_options: [
    'warning_level=1',
    'buildtype=debugoptimized',
  ]
)

# Import modules
gnome = import('gnome')
i18n = import('i18n')
pkgconfig = import('pkgconfig')

# Get compiler
cc = meson.get_compiler('c')

# Version information
version = meson.project_version()
version_list = version.split('.')
major_version = version_list[0]
minor_version = version_list[1]
micro_version = version_list[2]

api_version = '1.5.0'
binary_version = '3.0.0'
binary_major_version = binary_version.split('.')[0]

# Configuration data
atril_conf = configuration_data()
atril_conf.set_quoted('VERSION', version)
atril_conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())

if get_option('enable_dbus')
  atril_conf.set('ENABLE_DBUS', '')
endif

# Directory paths
prefix = get_option('prefix')
bindir = get_option('bindir')
datadir = get_option('datadir')
libdir = get_option('libdir')
includedir = get_option('includedir')
libexecdir = get_option('libexecdir')
desktopdir = join_paths(datadir, 'applications')
schema_dir = join_paths(datadir, 'glib-2.0', 'schemas')
header_dir = join_paths(meson.project_name(), api_version)

po_dir = join_paths(meson.project_source_root(), 'po')

# Dependencies
glib_version = '2.36.0'
gtk_version = '3.14.0'
gtk_api_version = '3.0'

cairo = dependency('cairo', version: '>= 1.14.0')
gail = dependency('gail-3.0')
gio = dependency('gio-2.0', version: '>= 2.36.0')
glib = dependency('glib-2.0', version: '>= ' + glib_version)
gmodule = dependency('gmodule-2.0')
gtk = dependency('gtk+-' + gtk_api_version, version: '>= ' + gtk_version)
ice = dependency('ice')
sm = dependency('sm')
X11 = dependency('x11')
xml = dependency('libxml-2.0', version: '>= 2.5.0')
zlib = dependency('zlib')
libsecret = dependency('libsecret-1', version: '>= 0.5', required: get_option('keyring'))
gtk_unix_print = dependency('gtk+-unix-print-3.0', version: '>= ' + gtk_version, required: get_option('gtk_unix_print'))
mate_desktop = dependency('mate-desktop-2.0', version: '>= 1.27.1')

# Backend configuration
enabled_backend_names = []
backend_subdirs = []
atril_mime_types = ''

# PDF backend
poppler = dependency('poppler-glib', required: get_option('pdf'))
if poppler.found()
  backend_subdirs += 'pdf'
  atril_mime_types += 'application/pdf;application/x-bzpdf;application/x-gzpdf;application/x-xzpdf;'
endif

# PostScript backend
spectre_ps = dependency('libspectre', version: '>= 0.2.0', required: get_option('ps'))
if spectre_ps.found()
  backend_subdirs += 'ps'
  atril_mime_types += 'application/postscript;application/x-bzpostscript;application/x-gzpostscript;image/x-eps;image/x-bzeps;image/x-gzeps;application/illustrator;'
endif

# DVI backend
kpathsea = dependency('kpathsea', required: get_option('dvi'))
spectre_dvi = dependency('libspectre', version: '>= 0.2.0', required:  get_option('dvi'))
if kpathsea.found() and spectre_dvi.found()
  atril_conf.set10('STDC_HEADERS', true)
  t1lib = cc.find_library('t1', required: get_option('t1lib'))
  t1_enabled = t1lib.found()
  backend_subdirs += 'dvi'
  atril_mime_types += 'application/x-dvi;application/x-bzdvi;application/x-gzdvi;'
endif

# DJVU backend
djvu = dependency('ddjvuapi', version: '>= 3.5.17', required: get_option('djvu'))
if djvu.found()
  backend_subdirs += 'djvu'
  atril_mime_types += 'image/vnd.djvu;image/vnd.djvu+multipage;'
endif

# TIFF backend
tiff = dependency('libtiff-4', required: get_option('tiff'))
if tiff.found()
  backend_subdirs += 'tiff'
  atril_mime_types += 'image/tiff;'
endif

# Pixbuf backend
if not get_option('pixbuf').disabled()
  backend_subdirs += 'pixbuf'
  atril_mime_types += 'image/*;'
  atril_conf.set10('ENABLE_PIXBUF', true)
endif

# Comics backend
libarchive_dep = dependency('libarchive', version: '>= 3.6.0', required: get_option('comics'))
if libarchive_dep.found()
  backend_subdirs += 'comics'
  comic_mimetypes = ';'.join([
    'application/vnd.comicbook-rar',
    'application/vnd.comicbook+zip',
    'application/x-cb7',
    'application/x-cbr',
    'application/x-cbt',
    'application/x-cbz',
    'application/x-ext-cb7',
    'application/x-ext-cbr',
    'application/x-ext-cbt',
    'application/x-ext-cbz',
  ]) + ';'
  atril_mime_types += comic_mimetypes
endif

# XPS backend
xps = dependency('libgxps', version: '>= 0.2.1', required: get_option('xps'))
if xps.found()
  backend_subdirs += 'xps'
  atril_mime_types += 'application/oxps;application/vnd.ms-xpsdocument;'
endif

thumbnailer_mime_types = atril_mime_types

# EPUB backend
webkit = dependency('webkit2gtk-4.1', version: '>= 2.4.3', required: get_option('epub'))
if webkit.found()
  backend_subdirs += 'epub'
  atril_mime_types += 'application/epub+zip;'

  # MathJax configuration
  mathjax_directory = get_option('mathjax-directory')
  if mathjax_directory == ''
    mathjax_directories = [
      '/usr/share/javascript/mathjax',
      '/usr/share/mathjax'
    ]

    fs = import('fs')
    foreach dir: mathjax_directories
      if fs.exists(join_paths(dir, 'MathJax.js'))
        mathjax_directory = dir
        break
      endif
    endforeach

    if mathjax_directory == ''
      # default to the first directory, just in case, and because that's what
      # we used to do in the code, which just means MathML might not work properly
      mathjax_directory = mathjax_directories[0]
      warning(('mathjax not found, using @0@ as fallback, but MathML might not work. ' +
               'Install mathjax or set "mathjax-directory" as needed.').format(mathjax_directory))
    endif
  endif

  atril_conf.set10('ENABLE_EPUB', true)
  atril_conf.set_quoted('MATHJAX_DIRECTORY', mathjax_directory)
endif

atril_conf.set_quoted('SUPPORTED_MIMETYPES', atril_mime_types)

# Math library
math = cc.find_library('m', required: false)

mate_submodules_dep = dependency('mate-submodules', version: '1.24.0',
fallback: ['mate-submodules', 'mate_submodules_dep'])

# Generate config.h
config_h_file = configure_file(
  output: 'config.h',
  configuration: atril_conf
)

config_h = declare_dependency(
  sources: config_h_file
)

# Include directories
include_dirs = include_directories('.', 'libdocument', 'libview', 'libmisc', 'cut-n-paste/toolbar-editor', 'properties')
include_root = include_directories('.')

# Headers
atril_document_header = [
  'atril-document.h'
]

atril_view_header = [
  'atril-view.h'
]

# Compiler flags
c_args = [
  '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()),
  '-DDATADIR="@0@"'.format(join_paths(prefix, datadir)),
  '-DMATEDATADIR="@0@"'.format(join_paths(prefix, datadir)),
  '-DLIBDIR="@0@"'.format(join_paths(prefix, libdir)),
  '-DBINDIR="@0@"'.format(join_paths(prefix, bindir)),
  '-DEV_BACKENDSDIR="@0@"'.format(join_paths(prefix, libdir, meson.project_name(), binary_major_version, 'backends')),
  '-DATRILDATADIR="@0@"'.format(join_paths(prefix, datadir, meson.project_name())),
  '-DMATELOCALEDIR="@0@"'.format(join_paths(prefix, datadir, 'locale')),
  '-Werror=implicit-function-declaration',
  '-DATRIL_COMPILATION',
  '-DPACKAGE_URL="https://mate-desktop.org"',
  '-include', 'config.h', 
]

cpp_args = [
  '-DATRIL_LOCALE_DIR="@0@"'.format(join_paths(prefix, datadir, 'locale')),
  '-DMATELOCALEDIR="@0@"'.format(join_paths(prefix, datadir, 'locale')),
  '-DATRIL_COMPILATION',
  '-DHAVE_CONFIG_H',
  '-DPACKAGE_URL="https://mate-desktop.org"'
]

# Maintainer mode configuration
if get_option('maintainer_mode')
  domains = ['G', 'ATK', 'PANGO', 'GDK', 'GDK_PIXBUF', 'GTK', 'MATE', 'LIBGLADE', 'VTE', 'WNCK', 'LIBSOUP']
  
  disable_deprecated_flags = []
  foreach domain : domains
    disable_deprecated_flags += '-D@0@_DISABLE_DEPRECATED'.format(domain)
    disable_deprecated_flags += '-D@0@_DISABLE_SINGLE_INCLUDES'.format(domain)
  endforeach
  
  c_args += disable_deprecated_flags
  cpp_args += disable_deprecated_flags
endif

# Additional conditional flags
if get_option('enable_debug')
  c_args += '-DEV_ENABLE_DEBUG'
  cpp_args += '-DEV_ENABLE_DEBUG'
endif

# Add compiler arguments
add_project_arguments(c_args, language: 'c')
add_project_arguments(cpp_args, language: 'cpp')

# Define shell_core_deps before including subdirectories that need it
shell_core_deps = [
  glib,
  gtk,
  gio,
]

subdir('libdocument')
subdir('libview')
subdir('libmisc')
subdir('backend')
subdir('data')

if get_option('thumbnailer')
  subdir('thumbnailer')
endif

if get_option('previewer')
  subdir('previewer')
endif

subdir('cut-n-paste/toolbar-editor')
subdir('cut-n-paste/zoom-control')
subdir('properties')

subdir('shell')
subdir('po')
subdir('help')
subdir('install-scripts')

# Tests (conditional on Meson version)
if meson.version().version_compare('>=0.46')
  subdir('test')
endif

# Install headers
atril_headers = [
  'atril-document.h',
  'atril-view.h',
]

install_headers(
  atril_headers,
  subdir: header_dir
)

# Generate pkg-config files
pc_conf = configuration_data()
pc_conf.set('prefix', prefix)
pc_conf.set('exec_prefix', '${prefix}')
pc_conf.set('libdir', join_paths('${prefix}', libdir))
pc_conf.set('includedir', join_paths('${prefix}', includedir))
pc_conf.set('EV_API_VERSION', api_version)
pc_conf.set('EV_BINARY_VERSION', binary_major_version)
pc_conf.set('VERSION', version)
pc_conf.set('GLIB_REQUIRED', glib_version)
pc_conf.set('GTK_API_VERSION', gtk_api_version)
pc_conf.set('GTK_REQUIRED', gtk_version)

configure_file(
  input: 'atril-document.pc.in',
  output: 'atril-document-@0@.pc'.format(api_version),
  configuration: pc_conf,
  install_dir: join_paths(libdir, 'pkgconfig')
)

configure_file(
  input: 'atril-view.pc.in',
  output: 'atril-view-@0@.pc'.format(api_version),
  configuration: pc_conf,
  install_dir: join_paths(libdir, 'pkgconfig')
)

# Summary output
summary = [
  '',
  '--- Build Configuration Summary For Atril ---',
  '',
  'prefix = @0@'.format(prefix),
  'bindir = @0@'.format(bindir),
  'datadir = @0@'.format(datadir),
  'libdir = @0@'.format(libdir),
  'includedir = @0@'.format(includedir),
  'libexecdir = @0@'.format(libexecdir),
  'desktopdir = @0@'.format(desktopdir),
  'schema_dir = @0@'.format(schema_dir),
  'ENABLE_DBUS = @0@'.format(get_option('enable_dbus')),
  'MathJax directory = @0@'.format(mathjax_directory),
  '',
  'Backends enabled:',
]

foreach backend_name : backend_subdirs
  summary += '    @0@'.format(backend_name)
endforeach

message('\n'.join(summary))
