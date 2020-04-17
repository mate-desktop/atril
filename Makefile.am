ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

SUBDIRS =       \
    po          \
    cut-n-paste \
    data        \
    libdocument \
    backend     \
    libview     \
    libmisc     \
    properties  \
    shell       \
    help

if ENABLE_TESTS
    SUBDIRS += test
endif

if ENABLE_THUMBNAILER
    SUBDIRS += thumbnailer
endif

if ENABLE_PREVIEWER
    SUBDIRS += previewer
endif

NULL =

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = \
    atril-document-$(EV_API_VERSION).pc \
    atril-view-$(EV_API_VERSION).pc \
    $(NULL)

headerdir = $(includedir)/atril/$(EV_API_VERSION)
header_DATA = \
    atril-document.h \
    atril-view.h \
    $(NULL)

# Applications 
EXTRA_DIST =            \
    $(header_DATA)      \
    autogen.sh

DISTCLEANFILES =

MAINTAINERCLEANFILES =       \
    ChangeLog                \
    $(srcdir)/INSTALL        \
    $(srcdir)/aclocal.m4     \
    $(srcdir)/autoscan.log   \
    $(srcdir)/compile        \
    $(srcdir)/config.guess   \
    $(srcdir)/config.h.in    \
    $(srcdir)/config.sub     \
    $(srcdir)/configure      \
    $(srcdir)/configure.scan \
    $(srcdir)/depcomp        \
    $(srcdir)/install-sh     \
    $(srcdir)/ltmain.sh      \
    $(srcdir)/missing        \
    $(srcdir)/mkinstalldirs  \
    $(srcdir)/omf.make       \
    $(srcdir)/xmldocs.make   \
    $(srcdir)/gtk-doc.make   \
    $(srcdir)/po/Makefile.in.in \
    `find "$(srcdir)" -type f -name Makefile.in -print`

DISTCHECK_CONFIGURE_FLAGS =   \
    --disable-schemas-compile \
    --enable-gtk-doc          \
    --disable-caja            \
    --disable-tests           \
    --disable-silent-rules    \
    --enable-compile-warnings=no \
    CFLAGS='-Wno-deprecated-declarations'

distuninstallcheck_listfiles = find . -type f -print | grep -v /share/mate/help/ | grep -v \.omf

# Build ChangeLog from GIT  history
ChangeLog:
	$(AM_V_GEN) if test -d $(top_srcdir)/.git; then \
		GIT_DIR="$(top_srcdir)/.git" git log --stat > $@; \
	fi

dist: ChangeLog

.PHONY: ChangeLog

-include $(top_srcdir)/git.mk
