# *****************************************************************************
# Versioning
# *****************************************************************************

m4_define([ev_major_version], [1])
m4_define([ev_minor_version], [28])
m4_define([ev_micro_version], [2])
m4_define([ev_extra_version], [])
m4_define([ev_version], [ev_major_version.ev_minor_version.ev_micro_version()ev_extra_version])

# The atril API version
m4_define([ev_api_version], [1.5.0])

# Libtool versioning. The backend and view libraries have separate versions.
# Before making a release, the libtool version should be modified.
# The string is of the form C:R:A.
# - If interfaces have been changed or added, but binary compatibility has
#   been preserved, change to C+1:0:A+1
# - If binary compatibility has been broken (eg removed or changed interfaces)
#   change to C+1:0:0
# - If the interface is the same as the previous version, change to C:R+1:A

# Libtool version of the backend library
m4_define([ev_document_lt_current], [3])
m4_define([ev_document_lt_revision], [0])
m4_define([ev_document_lt_age], [0])
m4_define([ev_document_lt_version_info], [ev_document_lt_current:ev_document_lt_revision:ev_document_lt_age])
m4_define([ev_document_lt_current_minus_age], [m4_eval(ev_document_lt_current - ev_document_lt_age)])

# Libtool version of the view library
m4_define([ev_view_lt_current], [3])
m4_define([ev_view_lt_revision], [0])
m4_define([ev_view_lt_age], [0])
m4_define([ev_view_lt_version_info], [ev_view_lt_current:ev_view_lt_revision:ev_view_lt_age])
m4_define([ev_view_lt_current_minus_age], [m4_eval(ev_view_lt_current - ev_view_lt_age)])

# Binary version for the document backends
m4_define([ev_binary_version], [ev_document_lt_current])

# *****************************************************************************

AC_PREREQ([2.57])

AC_INIT([atril],
        [ev_version],
        [https://github.com/mate-desktop/atril/issues],
        [atril],
        [https://mate-desktop.org])

AM_INIT_AUTOMAKE([1.10 foreign tar-ustar dist-xz no-dist-gzip check-news])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

if test -z "$enable_maintainer_mode"; then
    enable_maintainer_mode=yes
fi
AM_MAINTAINER_MODE([enable])

m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_CXX
AC_STDC_HEADERS
AM_PROG_LIBTOOL
AC_PROG_SED

MATE_MAINTAINER_MODE_DEFINES
MATE_COMPILE_WARNINGS
MATE_CXX_WARNINGS

dnl FIXME: remove this when required gtk+ >= 2.19.7
DISABLE_DEPRECATED=
AC_SUBST([DISABLE_DEPRECATED])

AM_GNU_GETTEXT([external])
AM_GNU_GETTEXT_VERSION([0.19.8])
AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])
AM_CONDITIONAL([USE_NLS], [test "x${USE_NLS}" = "xyes"])

GETTEXT_PACKAGE=AC_PACKAGE_NAME
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"], [Gettext package])

m4_pattern_allow([AM_V_GEN])dnl Make autoconf not complain about the rule below
EV_INTLTOOL_ATRIL_BACKEND_RULE='%.atril-backend:   %.atril-backend.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(AM_V_GEN) LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@'
AC_SUBST([EV_INTLTOOL_ATRIL_BACKEND_RULE])

GLIB_GSETTINGS

dnl Specify required versions of dependencies
CAIRO_REQUIRED=1.14.0
GLIB_REQUIRED=2.54.0
GTK_REQUIRED=3.22.0
MATE_DESKTOP_REQUIRED=1.27.1
WEBKIT_REQUIRED=2.6.0
LIBSECRET_REQUIRED=0.5
LIBXML_REQUIRED=2.5.0
SYNCTEX_REQUIRED=1.21

AC_SUBST([GLIB_REQUIRED])
AC_SUBST([GTK_REQUIRED])

dnl Check dependencies

# LIB_CFLAGS       for helpers and generic widgets. (libdocument, cut-and-paste)
# BACKEND_CFLAGS   for backend implementations.
# FRONTEND_CFLAGS  for frontend implementations. (properties, thumbnailer)
# FRONTEND_LIBS
# SHELL_CFLAGS     for shell implementation.
# SHELL_LIBS

AC_SEARCH_LIBS([hypot],[m])

PKG_CHECK_MODULES(GLIB, glib-2.0 >= $GLIB_REQUIRED)
PKG_CHECK_MODULES(LIBDOCUMENT, gtk+-3.0 >= $GTK_REQUIRED gio-2.0 >= $GLIB_REQUIRED)
PKG_CHECK_MODULES(LIBVIEW, gtk+-3.0 >= $GTK_REQUIRED gail-3.0 >= $GTK_REQUIRED gthread-2.0 gio-2.0 >= $GLIB_REQUIRED)
PKG_CHECK_MODULES(BACKEND, cairo >= $CAIRO_REQUIRED gtk+-3.0 >= $GTK_REQUIRED)
PKG_CHECK_MODULES(FRONTEND_CORE, gtk+-3.0 >= $GTK_REQUIRED gthread-2.0 gio-2.0 >= $GLIB_REQUIRED)
PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)

PKG_CHECK_MODULES([SHELL_CORE],[libxml-2.0 >= $LIBXML_REQUIRED gtk+-3.0 >= $GTK_REQUIRED gio-2.0 >= $GLIB_REQUIRED gthread-2.0 x11 mate-desktop-2.0 >= $MATE_DESKTOP_REQUIRED])

AC_SUBST(GLIB_CFLAGS)
AC_SUBST(GLIB_LIBS)

# ***************
# Build utilities
# ***************

AC_ARG_VAR([GLIB_GENMARSHAL],[the glib-genmarschal programme])
AC_PATH_PROG([GLIB_GENMARSHAL],[glib-genmarshal],[])
if test -z "$GLIB_GENMARSHAL"; then
  AC_MSG_ERROR([glib-genmarshal not found])
fi

AC_ARG_VAR([GLIB_MKENUMS],[the glib-mkenums programme])
AC_PATH_PROG([GLIB_MKENUMS],[glib-mkenums],[])
if test -z "$GLIB_MKENUMS"; then
  AC_MSG_ERROR([glib-mkenums not found])
fi

AC_ARG_VAR([GLIB_COMPILE_RESOURCES],[the glib-compile-resources programme])
AC_PATH_PROG([GLIB_COMPILE_RESOURCES],[glib-compile-resources],[])
if test -z "$GLIB_COMPILE_RESOURCES"; then
  AC_MSG_ERROR([glib-compile-resources not found])
fi

AC_ARG_VAR([XMLLINT],[the xmllint programme])
AC_PATH_PROG([XMLLINT],[xmllint],[])
if test -z "$XMLLINT"; then
  AC_MSG_ERROR([xmllint not found])
fi

dnl
dnl zlib support
dnl

PKG_CHECK_MODULES([ZLIB], [zlib], [found_zlib=yes], [found_zlib=no])
AS_IF([test "x$found_zlib" = "xno"], [
  AC_CHECK_LIB(z, inflate, [AC_CHECK_HEADER(zlib.h, found_zlib=yes)])
  if test "x$found_zlib" = "xno" ; then
    AC_MSG_ERROR([*** Working zlib library and headers not found ***])
  fi
  ZLIB_LIBS='-lz'
  AC_SUBST(ZLIB_LIBS)
])

AC_ARG_VAR([GDBUS_CODEGEN],[the gdbus-codegen programme])
AC_PATH_PROG([GDBUS_CODEGEN],[gdbus-codegen],[])
if test -z "$GDBUS_CODEGEN"; then
  AC_MSG_ERROR([gdbus-codegen not found])
fi

 # *********
 # SM client
 # *********

PKG_CHECK_MODULES([LIBEGG],[glib-2.0 gtk+-3.0 gthread-2.0 sm >= 1.0.0 ice])
AC_SUBST([LIBEGG_CFLAGS])
AC_SUBST([LIBEGG_LIBS])

# ***

BACKEND_LIBTOOL_FLAGS="-module -avoid-version -no-undefined -export-symbols \$(top_srcdir)/backend/backend.symbols"
AC_SUBST(BACKEND_LIBTOOL_FLAGS)

# ******************
# GKT+ Unix Printing
# ******************

AC_MSG_CHECKING([whether gtk+-unix-print support is requested])
AC_ARG_WITH([gtk-unix-print],
  [AS_HELP_STRING([--without-gtk-unix-print],
                  [Disable the use of gtk-unix-print])],
  [],[with_gtk_unix_print=yes])

AC_MSG_RESULT([$with_gtk_unix_print])

if test "$with_gtk_unix_print" = "yes"; then
   PKG_CHECK_MODULES(GTKUNIXPRINT, [gtk+-unix-print-3.0 >= $GTK_REQUIRED])
   AC_DEFINE([GTKUNIXPRINT_ENABLED], [1], [Define if gtk+-unix-print is enabled.])
fi

# *********************
# Keyring support
# *********************

AC_ARG_WITH(keyring,
        [AS_HELP_STRING([--without-keyring],
                        [Disable the use of libsecret and keyring])],
        [],
        [with_keyring=yes])

AM_CONDITIONAL([WITH_KEYRING],[test "$with_keyring" = "yes"])

if test "$with_keyring" = "yes"; then
        PKG_CHECK_MODULES(LIBSECRET, libsecret-1 >= $LIBSECRET_REQUIRED)
        AC_DEFINE([WITH_KEYRING],[1],[Define if KEYRING support is enabled])
fi

# ****
# DBUS
# ****

AC_ARG_ENABLE([dbus],
  [AS_HELP_STRING([--disable-dbus], [Disable support for dbus])],
  [],
  [enable_dbus=yes])

if test "$enable_dbus" = "yes"; then
  AC_DEFINE([ENABLE_DBUS],[1],[Define if DBUS support is enabled])

   PKG_CHECK_MODULES([EV_DAEMON], [gio-2.0 >= $GLIB_REQUIRED])
fi

AM_CONDITIONAL([ENABLE_DBUS], [test "$enable_dbus" = "yes"])

dnl Debug mode

AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug],
                   [Turn on atril debug mode]),
    [enable_debug=$enableval],
    [enable_debug=no])

if test "x$enable_debug" = "xyes"; then
   DEBUG_FLAGS="-DEV_ENABLE_DEBUG"
fi

AC_ARG_ENABLE([tests],
    AS_HELP_STRING([--enable-tests], [Enable the tests]),
    [enable_tests=$enableval],
    [enable_tests=yes])

AM_CONDITIONAL(ENABLE_TESTS, test x$enable_tests = xyes)

LIBDOCUMENT_CFLAGS="$LIBDOCUMENT_CFLAGS $DEBUG_FLAGS"
LIBDOCUMENT_LIBS="$LIBDOCUMENT_LIBS"
AC_SUBST(LIBDOCUMENT_CFLAGS)
AC_SUBST(LIBDOCUMENT_LIBS)

LIBVIEW_CFLAGS="$LIBVIEW_CFLAGS $GTKUNIXPRINT_CFLAGS $DEBUG_FLAGS"
LIBVIEW_LIBS="$LIBVIEW_LIBS $GTKUNIXPRINT_LIBS -lm"
AC_SUBST(LIBVIEW_CFLAGS)
AC_SUBST(LIBVIEW_LIBS)

BACKEND_CFLAGS="$BACKEND_CFLAGS -DGDK_MULTIHEAD_SAFE -DGTK_MULTIHEAD_SAFE $DEBUG_FLAGS"
BACKEND_LIBS="$BACKEND_LIBS -lm"
AC_SUBST(BACKEND_CFLAGS)
AC_SUBST(BACKEND_LIBS)

SHELL_CFLAGS="$SHELL_CORE_CFLAGS $LIBSECRET_CFLAGS -DGDK_MULTIHEAD_SAFE -DGTK_MULTIHEAD_SAFE $DEBUG_FLAGS"
SHELL_LIBS="$SHELL_CORE_LIBS $LIBSECRET_LIBS -lz -lm"
AC_SUBST(SHELL_CFLAGS)
AC_SUBST(SHELL_LIBS)

FRONTEND_CFLAGS="$FRONTEND_CORE_CFLAGS $DEBUG_FLAGS"
FRONTEND_LIBS="$FRONTEND_CORE_LIBS -lz"
AC_SUBST(FRONTEND_CFLAGS)
AC_SUBST(FRONTEND_LIBS)

EV_DAEMON_CFLAGS="$EV_DAEMON_CFLAGS $DEBUG_FLAGS"
AC_SUBST([EV_DAEMON_CFLAGS])
AC_SUBST([EV_DAEMON_LIBS])

# Check for Caja property page build
AC_ARG_ENABLE([caja],
  [AS_HELP_STRING([--disable-caja],
                  [Disable build of caja extensions])],
  [],
  [enable_caja=yes])

if test "$enable_caja" = "yes" ; then
  PKG_CHECK_MODULES([CAJA],[gtk+-x11-3.0 $MM gthread-2.0 libcaja-extension >= 1.17.1],
                    [],[AC_MSG_ERROR([libcaja-extension not found; use --disable-caja to disable the caja extensions])])
  CAJA_EXTENSION_DIR=`$PKG_CONFIG --variable=extensiondir libcaja-extension`
  AC_SUBST([cajaextensiondir],[$CAJA_EXTENSION_DIR])
  AC_SUBST(CAJA_CFLAGS)
  AC_SUBST(CAJA_LIBS)

  AC_DEFINE([HAVE_CAJA],[1], [defined if you build the caja plugin])
fi

AM_CONDITIONAL([ENABLE_CAJA],[test "$enable_caja" = "yes"])

# Check for thumbnailer build

AC_ARG_ENABLE([thumbnailer],
  [AS_HELP_STRING([--disable-thumbnailer],
                  [Disable MATE thumbnailer])],
  [],
  [enable_thumbnailer=yes])

AM_CONDITIONAL([ENABLE_THUMBNAILER],[test "$enable_thumbnailer" = "yes"])

# ***************
# Print Previewer
# ***************

AC_ARG_ENABLE([previewer],
  [AS_HELP_STRING([--disable-previewer],
                  [Disable the MATE Document Previewer])],
  [],
  [enable_previewer=yes])

if test x$enable_previewer = "xyes" ; then
  PKG_CHECK_MODULES([PREVIEWER],[gtk+-3.0 >= $GTK_REQUIRED gthread-2.0 gio-2.0 >= $GLIB_REQUIRED])
fi

AM_CONDITIONAL([ENABLE_PREVIEWER],[test "$enable_previewer" = "yes"])
PREVIEWER_CFLAGS="$PREVIEWER_CFLAGS $GTKUNIXPRINT_CFLAGS $DEBUG_FLAGS"
PREVIEWER_LIBS="$PREVIEWER_LIBS $GTKUNIXPRINT_LIBS -lz"
AC_SUBST(PREVIEWER_CFLAGS)
AC_SUBST(PREVIEWER_LIBS)

# ***
# GIR
# ***

AC_MSG_CHECKING([whether GObject introspection is requested])
AC_ARG_ENABLE([introspection],
    AS_HELP_STRING([--enable-introspection],
                   [Enable GObject introspection]),
    [enable_introspection=$enableval],
    [enable_introspection=no])
AC_MSG_RESULT([$enable_introspection])

G_IR_SCANNER=
G_IR_COMPILER=
G_IR_GENERATE=
GIRDIR=
GIRTYPELIBDIR=

if test "$enable_introspection" = "yes"; then
  GOBJECT_INTROSPECTION_REQUIRED=0.6
  PKG_CHECK_MODULES([GOBJECT_INTROSPECTION],[gobject-introspection-1.0 >= $GOBJECT_INTROSPECTION_REQUIRED])

  G_IR_SCANNER="$($PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0)"
  G_IR_COMPILER="$($PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0)"
  G_IR_GENERATE="$($PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0)"
  GIRDIR="$($PKG_CONFIG --variable=girdir gobject-introspection-1.0)"
  GIRTYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
fi

AC_SUBST([G_IR_SCANNER])
AC_SUBST([G_IR_COMPILER])
AC_SUBST([G_IR_GENERATE])
AC_SUBST([GIRDIR])
AC_SUBST([GIRTYPELIBDIR])

AM_CONDITIONAL([ENABLE_INTROSPECTION],[test "$enable_introspection" = "yes"])

dnl ================== libsynctex ===========================================
AC_ARG_ENABLE([synctex],
  [--enable-synctex  enable support for synctex)],
  [case "${enableval}" in
    yes) synctex=true ;;
    no)  synctex=false;;
    *) AC_MSG_ERROR([bad value ${enableval} for --enable-synctex]) ;;
  esac],[enable_synctex=yes])


if test "$enable_synctex" = "yes"; then
  AC_DEFINE([ENABLE_SYNCTEX],[1],[Define if synctex support is enabled])
  PKG_CHECK_MODULES(SYNCTEX, [synctex >= $SYNCTEX_REQUIRED], has_synctex=yes, has_synctex=no)
  dnl not found? use internal code copy.
  if test "x$has_synctex" = "xno"; then
          AC_MSG_ERROR("SyncTeX support is disabled since library version $SYNCTEX_REQUIRED or newer not found")
  fi
  AC_SUBST(SYNCTEX_LIBS)
  AC_SUBST(SYNCTEX_CFLAGS)
fi

AM_CONDITIONAL([ENABLE_SYNCTEX], [test "$enable_synctex" = "yes"])


dnl ================== portability checks ===========================================

dnl for backtrace()
AC_CHECK_HEADERS([execinfo.h])

AC_CHECK_DECL([_NL_MEASUREMENT_MEASUREMENT],[
  AC_DEFINE([HAVE__NL_MEASUREMENT_MEASUREMENT],[1],[Define if _NL_MEASUREMENT_MEASUREMENT is available])
  ],[],[#include <langinfo.h>])

dnl ================== pdf checks ===================================================
AC_ARG_ENABLE([pdf],
  [AS_HELP_STRING([--disable-pdf],
                  [Disable the PDF support])],
  [enable_pdf=$enableval],
  [enable_pdf=yes])

if test "x$enable_pdf" = "xyes"; then
    POPPLER_REQUIRED=0.22.0
    PKG_CHECK_MODULES(POPPLER, poppler-glib >= $POPPLER_REQUIRED libxml-2.0 >= $LIBXML_REQUIRED,enable_pdf=yes,enable_pdf=no)

    if test "x$enable_pdf" = "xyes"; then
        PKG_CHECK_MODULES(CAIRO_PDF, cairo-pdf, enable_cairo_pdf=yes, enable_cairo_pdf=no)
        if test x$enable_cairo_pdf = xyes; then
            AC_DEFINE([HAVE_CAIRO_PDF], [1], [defined if cairo-pdf is available])
        fi

        PKG_CHECK_MODULES(CAIRO_PS, cairo-ps, enable_cairo_ps=yes, enable_cairo_ps=no)
        if test x$enable_cairo_ps = xyes; then
            AC_DEFINE([HAVE_CAIRO_PS], [1], [defined if cairo-ps is available])
        fi
    else
        AC_MSG_ERROR("PDF support is disabled since poppler-glib library version $POPPLER_REQUIRED or newer not found")
    fi
fi

AM_CONDITIONAL(ENABLE_PDF, test x$enable_pdf = xyes)
dnl ================== end of pdf checks ============================================

dnl libspectre (used by ps and dvi backends)
SPECTRE_REQUIRED=0.2.0
PKG_CHECK_MODULES(SPECTRE, libspectre >= $SPECTRE_REQUIRED,have_spectre=yes,have_spectre=no)
AM_CONDITIONAL(HAVE_SPECTRE, test x$have_spectre = xyes)
if test "x$have_spectre" = "xyes"; then
   AC_DEFINE([HAVE_SPECTRE], [1], [Have libspectre])
fi

dnl ================== ps checks ====================================================
AC_ARG_ENABLE(ps,
    [AS_HELP_STRING([--disable-ps],
                    [Disable the PostScript backend])],
    [enable_ps=$enableval],
    [enable_ps=yes])

if test "x$enable_ps" = "xyes"; then
   if test "x$have_spectre" = "xyes"; then
      AC_DEFINE([ENABLE_PS], [1], [Enable support for PostScript files.])
   else
      enable_ps="no"
      AC_MSG_WARN([PS support is disabled since libspectre (version >= $SPECTRE_REQUIRED) is needed])
   fi
fi
AM_CONDITIONAL(ENABLE_PS, test x$enable_ps = xyes)
dnl ======================== End of ps checks ===================================

dnl ================== tiff checks ===================================================
AC_ARG_ENABLE(tiff,
    [AS_HELP_STRING([--disable-tiff],
                    [Disable the support of multipage tiff])],
    [enable_tiff=$enableval],
    [enable_tiff=yes])

if test "x$enable_tiff" = "xyes"; then
    AC_CHECK_HEADERS([tiff.h],enable_tiff=yes,enable_tiff=no,)
    if test "x$enable_tiff" = "xyes"; then
        AC_CHECK_LIB([tiff],TIFFOpen,enable_tiff=yes,enable_tiff=no,"-lz")
        AC_CHECK_LIB([tiff],TIFFReadRGBAImageOriented,enable_tiff=yes,enable_tiff=no,"-lz")
    fi
    if test "x$enable_tiff" = "xyes"; then
        AC_DEFINE([ENABLE_TIFF], [1], [Enable multipage tiff support.])
    else
        AC_MSG_WARN("Tiff support is disabled since tiff library version 3.6 or newer not found")
    fi
fi

AM_CONDITIONAL(ENABLE_TIFF, test x$enable_tiff = xyes)
dnl ================== end of tiff checks ============================================

dnl ================== djvu checks ===================================================

AC_ARG_ENABLE(djvu,
    [AS_HELP_STRING([--disable-djvu],
                    [Disable the support of djvu viewer])],
    [enable_djvu=$enableval],
    [enable_djvu=yes])

if test "x$enable_djvu" = "xyes"; then
    DJVULIBRE_REQUIRED=3.5.17
    PKG_CHECK_MODULES(DJVU, ddjvuapi >= $DJVULIBRE_REQUIRED, enable_djvu=yes, enable_djvu=no)

    if test "x$enable_djvu" = "xyes"; then
        AC_DEFINE([ENABLE_DJVU], [1], [Enable djvu viewer support.])
    else
    AC_MSG_WARN([
** Djvu support is disabled since a recent version of the djvulibre
** library was not found. You need at least djvulibre-3.5.17 which
** can be found on http://djvulibre.djvuzone.org
])
    fi
fi

AM_CONDITIONAL(ENABLE_DJVU, test x$enable_djvu = xyes)

dnl ================== End of djvu checks ===================================================

dnl ================== dvi checks ===================================================

AC_ARG_ENABLE(dvi,
    [AS_HELP_STRING([--disable-dvi],
                    [Disable the support of dvi viewer])],
    [enable_dvi=$enableval],
    [enable_dvi=yes])

AC_ARG_ENABLE(t1lib,
    [AS_HELP_STRING([--enable-t1lib],
                    [Compile with support of t1lib for type1 fonts in dvi])],
    [enable_type1_fonts=$enableval],
    [enable_type1_fonts=no])

if test "x$enable_dvi" = "xyes"; then
    AC_C_CONST
    AC_C_INLINE
    AC_TYPE_SIZE_T
    AC_CHECK_SIZEOF(long, 4)
    AC_CHECK_SIZEOF(int, 4)
    AC_CHECK_SIZEOF(short, 2)
    AC_CHECK_SIZEOF(void *, 4)
    AC_CHECK_LIB([kpathsea], [kpse_init_prog], [enable_dvi=yes], [enable_dvi=no])

    if test "x$enable_dvi" = "xyes"; then
        AC_DEFINE([ENABLE_DVI], [1], [Enable dvi viewer support.])
    else
        AC_MSG_WARN("Dvi support is disabled since kpathsea library is not found. Check your TeX installation.")
    fi
fi
AM_CONDITIONAL(ENABLE_DVI, test x$enable_dvi = xyes)

if test "x$enable_dvi" = "xyes"; then
    if test "x$enable_type1_fonts" = "xyes"; then
        AC_CHECK_LIB([t1],T1_InitLib,enable_type1_fonts=yes,enable_type1_fonts=no,[-lm])
    fi

    if test "x$enable_type1_fonts" = xyes; then
        AC_DEFINE([WITH_TYPE1_FONTS], [1], [Enable t1lib support in dvi.])
    fi
else
    enable_type1_fonts=no
fi
AM_CONDITIONAL(WITH_TYPE1_FONTS, test x$enable_type1_fonts = xyes)

dnl ================== End of dvi checks ===================================================

dnl ================== pixbuf checks ===================================================

AC_ARG_ENABLE(pixbuf,
    [AS_HELP_STRING([--enable-pixbuf],
                    [Compile with support of pixbuf])],
    [enable_pixbuf=$enableval],
    [enable_pixbuf=no])

if test "x$enable_pixbuf" = "xyes"; then
    AC_DEFINE([ENABLE_PIXBUF], [1], [Enable pixbuf support.])
fi

AM_CONDITIONAL(ENABLE_PIXBUF, test x$enable_pixbuf = xyes)

dnl ================== End of pixbuf checks ===================================================

dnl ================== comic book checks ===================================================

AC_ARG_ENABLE(comics,
    [AS_HELP_STRING([--enable-comics],
                    [Compile with support for comic book archives])],
    [enable_comics=$enableval],
    [enable_comics=yes])

COMICS_DEPS="libarchive"
if test "x$enable_comics" = "xyes"; then
    AC_DEFINE([ENABLE_COMICS], [1], [Enable support for comics.])
    PKG_CHECK_MODULES([COMICS], [$COMICS_DEPS])
    AC_SUBST(COMICS_LIBS)
fi
AM_CONDITIONAL(ENABLE_COMICS, test x$enable_comics = xyes)

dnl ================== End of comic book checks ============================================

dnl ================== XPS checks ===================================================

AC_ARG_ENABLE(xps,
	[AS_HELP_STRING([--enable-xps],
			[Compile with support for XPS documents.])],
	[enable_xps=$enableval],
	[enable_xps=yes])

if test "x$enable_xps" = "xyes"; then
   GXPS_REQUIRED=0.2.1
   PKG_CHECK_MODULES(GXPS, libgxps >= $GXPS_REQUIRED,enable_xps=yes,enable_xps=no)

   if test "x$enable_xps" = "xyes"; then
      AC_DEFINE([ENABLE_XPS], [1], [Enable support for XPS documents.])
   else
      enable_xps="no"
      AC_MSG_WARN(["XPS support is disabled since libgxps (version >= $GXPS_REQUIRED) is needed"])
   fi
fi

AM_CONDITIONAL(ENABLE_XPS, test x$enable_xps = xyes)

dnl ================== End of XPS checks ===================================================


dnl ================== EPUB checks ===================================================

AC_ARG_ENABLE(epub,
	[AS_HELP_STRING([--enable-epub],
			[Compile with support for epub documents.])],
	[enable_epub=$enableval],
	[enable_epub=yes])

have_webkit="no"
if test "x$enable_epub" = "xyes"; then
    dnl select the available WebKit2Gtk4 version, with a preference towards 4.1
    webkit_pkg=webkit2gtk-4.1
    PKG_CHECK_EXISTS([$webkit_pkg >= $WEBKIT_REQUIRED], [],
                     [PKG_CHECK_EXISTS([webkit2gtk-4.0 >= $WEBKIT_REQUIRED],
                                       [webkit_pkg=webkit2gtk-4.0])])

    PKG_CHECK_MODULES(EPUB, $webkit_pkg >= $WEBKIT_REQUIRED \
       libxml-2.0 >= $LIBXML_REQUIRED zlib,have_webkit=yes,have_webkit=no)

    if test "x$have_webkit" = "xyes"; then
       AC_DEFINE([ENABLE_EPUB], [1], [Enable support for ePub documents.])
    else
       AC_MSG_WARN(["ePub support is disabled."])
    fi
fi

AM_CONDITIONAL(ENABLE_EPUB, test x$have_webkit = xyes)

dnl ================== End of EPUB checks ===================================================

dnl =================== Mime types list ====================================================

if test "x$enable_pdf" = "xyes" ; then
    ATRIL_MIME_TYPES="application/pdf;application/x-bzpdf;application/x-gzpdf;application/x-xzpdf;"
fi
if test "x$enable_ps" = "xyes" ; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}application/postscript;application/x-bzpostscript;application/x-gzpostscript;image/x-eps;image/x-bzeps;image/x-gzeps;"
fi
if test "x$enable_dvi" = "xyes"; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}application/x-dvi;application/x-bzdvi;application/x-gzdvi;"
fi
if test "x$enable_djvu" = "xyes"; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}image/vnd.djvu;image/vnd.djvu+multipage;"
fi
if test "x$enable_tiff" = "xyes"; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}image/tiff;"
fi
if test "x$enable_comics" = "xyes"; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}application/x-cbr;application/x-cbz;application/x-cb7;application/x-cbt;application/vnd.comicbook+zip;application/vnd.comicbook-rar;"
fi
if test "x$enable_pixbuf" = "xyes"; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}image/*;"
fi
if test "x$enable_xps" = "xyes"; then
    ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}application/oxps;application/vnd.ms-xpsdocument;"
fi
if test "x$have_webkit" = "xyes"; then
	ATRIL_MIME_TYPES="${ATRIL_MIME_TYPES}application/epub+zip;"
fi

AC_SUBST(ATRIL_MIME_TYPES)

# *****************
# Help files
# *****************

YELP_HELP_INIT

# *****************
# API documentation
# *****************

GTK_DOC_CHECK([1.13], [--flavour no-tmpl])

AC_SUBST([GLIB_PREFIX], [$($PKG_CONFIG --variable=prefix glib-2.0)])
AC_SUBST([GTK_PREFIX], [$($PKG_CONFIG --variable=prefix gtk+-3.0)])

# ******************
# Backends directory
# ******************

AC_SUBST([backenddir],"\$(libdir)/atril/ev_binary_version/backends")
AC_SUBST([backend_binary_version], "ev_binary_version")

# **********
# Versioning
# **********

AC_SUBST([EV_MAJOR_VERSION], [ev_major_version])
AC_SUBST([EV_MINOR_VERSION], [ev_minor_version])
AC_SUBST([EV_MICRO_VERSION], [ev_micro_version])

AC_SUBST([EV_API_VERSION], [ev_api_version])
AC_SUBST([EV_API_VERSION_U], [AS_TR_SH([ev_api_version])])
AC_SUBST([EV_BINARY_VERSION], [ev_binary_version])

AC_SUBST([EV_DOCUMENT_LT_VERSION_INFO],[ev_document_lt_version_info])
AC_SUBST([EV_DOCUMENT_LT_CURRENT_MINUS_AGE],[ev_document_lt_current_minus_age])
AC_SUBST([EV_VIEW_LT_VERSION_INFO], [ev_view_lt_version_info])
AC_SUBST([EV_VIEW_LT_CURRENT_MINUS_AGE], [ev_view_lt_current_minus_age])

# *****************************************************************************
# *****************************************************************************

AC_CONFIG_FILES([
backend/Makefile
backend/comics/Makefile
backend/djvu/Makefile
backend/dvi/Makefile
backend/dvi/mdvi-lib/Makefile
backend/epub/Makefile
backend/epub/minizip/Makefile
backend/pdf/Makefile
backend/pixbuf/Makefile
backend/ps/Makefile
backend/tiff/Makefile
backend/xps/Makefile
cut-n-paste/Makefile
cut-n-paste/smclient/Makefile
cut-n-paste/smclient/libegg/Makefile
cut-n-paste/toolbar-editor/Makefile
cut-n-paste/zoom-control/Makefile
data/atril.appdata.xml.in
data/atril.desktop.in
data/Makefile
data/icons/Makefile
help/Makefile
help/reference/Makefile
help/reference/libdocument/Makefile
help/reference/libdocument/version.xml
help/reference/libview/Makefile
help/reference/libview/version.xml
help/reference/shell/Makefile
help/reference/shell/version.xml
libdocument/Makefile
libdocument/ev-version.h
libmisc/Makefile
libview/Makefile
Makefile
po/Makefile.in
previewer/Makefile
properties/libatril-properties-page.caja-extension.desktop.in
properties/Makefile
shell/Makefile
test/Makefile
thumbnailer/Makefile
])

AC_CONFIG_FILES(atril-document-[]ev_api_version[].pc:atril-document.pc.in)
AC_CONFIG_FILES(atril-view-[]ev_api_version[].pc:atril-view.pc.in)

AC_OUTPUT

echo "
Configure summary:

    ${PACKAGE_STRING}
    `echo $PACKAGE_STRING | sed "s/./=/g"`

    prefix..............:    ${prefix}
    compiler............:    ${CC}
    cflags..............:    ${CFLAGS}
    warning flags.......:    ${WARN_CFLAGS}

    GTK+ Unix Print.....:    $with_gtk_unix_print
    Keyring Support.....:    $with_keyring
    DBUS Support........:    $enable_dbus
    Caja Plugin.........:    $enable_caja
    Thumbnailer.........:    $enable_thumbnailer
    Previewer...........:    $enable_previewer
    Gtk-Doc Support.....:    $enable_gtk_doc
    Debug mode..........:    $enable_debug
    GObj. Introspection.:    $enable_introspection
    Use NLS.............:    ${USE_NLS}
    Tests...............:    $enable_tests

    PDF Backend.........:    $enable_pdf
    Synctex enabled.....:    $enable_synctex
    PostScript Backend..:    $enable_ps
    TIFF Backend........:    $enable_tiff
    DJVU Backend........:    $enable_djvu
    DVI Backend.........:    $enable_dvi
    Pixbuf Backend......:    $enable_pixbuf
    Comics Backend......:    $enable_comics
    XPS Backend.........:    $enable_xps
    ePub Backend........:    $have_webkit
"
