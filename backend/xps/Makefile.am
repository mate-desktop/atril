AM_CPPFLAGS =                                      \
        -I$(top_srcdir)                         \
        -I$(top_srcdir)/libdocument             \
        -DMATELOCALEDIR=\"$(datadir)/locale\"   \
        -DATRIL_COMPILATION                     \
        $(BACKEND_CFLAGS)                       \
        $(WARN_CFLAGS)                          \
        $(DISABLE_DEPRECATED)

backend_LTLIBRARIES = libxpsdocument.la

libxpsdocument_la_SOURCES =    \
        xps-document.c         \
        xps-document.h

libxpsdocument_la_LDFLAGS = $(BACKEND_LIBTOOL_FLAGS)
libxpsdocument_la_LIBADD =                             \
        $(top_builddir)/libdocument/libatrildocument.la \
        $(BACKEND_LIBS)                 \
        $(GXPS_LIBS)

backend_in_files = xpsdocument.atril-backend.desktop.in
backend_DATA = $(backend_in_files:.atril-backend.desktop.in=.atril-backend)
$(backend_DATA): $(backend_in_files)
if USE_NLS
	$(AM_V_GEN) $(MSGFMT) --desktop --keyword=TypeDescription --template $< -d $(top_srcdir)/po -o $@
else
	$(AM_V_GEN) cp -f $< $@
endif

EXTRA_DIST = $(backend_in_files)

CLEANFILES = $(backend_DATA)

-include $(top_srcdir)/git.mk
