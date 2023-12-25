AM_CPPFLAGS =                      		\
	-I$(top_srcdir)				\
	-I$(top_srcdir)/libdocument 		\
	-DMATELOCALEDIR=\"$(datadir)/locale\"	\
	-DATRIL_COMPILATION			\
	$(BACKEND_CFLAGS)			\
	$(LIB_CFLAGS)				\
	$(WARN_CFLAGS)				\
	$(DISABLE_DEPRECATED)

backend_LTLIBRARIES = libcomicsdocument.la

libcomicsdocument_la_SOURCES = \
	comics-document.c      \
	comics-document.h      \
	ev-archive.c     \
	ev-archive.h

libcomicsdocument_la_LDFLAGS = $(BACKEND_LIBTOOL_FLAGS)
libcomicsdocument_la_LIBADD =				\
	$(top_builddir)/libdocument/libatrildocument.la	\
	$(BACKEND_LIBS)					\
	$(COMICS_LIBS)					\
	$(LIB_LIBS)

backend_in_files = comicsdocument.atril-backend.desktop.in
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
