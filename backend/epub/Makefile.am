AM_CPPFLAGS = 		       			\
	-I$(top_srcdir)				\
	-I$(top_srcdir)/libdocument		\
	-DMATELOCALEDIR=\"$(datadir)/locale\"	\
	-DATRIL_COMPILATION			\
	$(BACKEND_CFLAGS)			\
	$(WARN_CFLAGS)				\
	$(EPUB_CFLAGS)				\
	$(DISABLE_DEPRECATED)

backend_LTLIBRARIES = libepubdocument.la

libepubdocument_la_SOURCES =	\
	epub-document.c		\
	epub-document.h

libepubdocument_la_LDFLAGS = $(BACKEND_LIBTOOL_FLAGS)
libepubdocument_la_LIBADD =				\
	$(top_builddir)/libdocument/libatrildocument.la	\
	$(EPUB_LIBS)					\
	$(BACKEND_LIBS)


backend_in_files = epubdocument.atril-backend.desktop.in
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
