AM_CPPFLAGS =					\
	-I$(top_srcdir)				\
	-I$(top_srcdir)/libdocument		\
	-DMATELOCALEDIR=\"$(datadir)/locale\"  \
	-DATRIL_COMPILATION			\
	$(BACKEND_CFLAGS)			\
	$(POPPLER_CFLAGS)                       \
	$(WARN_CXXFLAGS)			\
	$(DISABLE_DEPRECATED)

backend_LTLIBRARIES = libpdfdocument.la

libpdfdocument_la_SOURCES =			\
	ev-poppler.cc				\
	ev-poppler.h

libpdfdocument_la_LDFLAGS = $(BACKEND_LIBTOOL_FLAGS)
libpdfdocument_la_LIBADD =				\
	$(top_builddir)/libdocument/libatrildocument.la	\
	$(BACKEND_LIBS)					\
	$(POPPLER_LIBS)					\
	$(CAIRO_PDF_LIBS)				\
	$(CAIRO_PS_LIBS)

backend_in_files = pdfdocument.atril-backend.desktop.in
backend_DATA = $(backend_in_files:.atril-backend.desktop.in=.atril-backend)

EXTRA_DIST = $(backend_in_files)

CLEANFILES = $(backend_DATA)

$(backend_DATA): $(backend_in_files)
if USE_NLS
	$(AM_V_GEN) $(MSGFMT) --desktop --keyword=TypeDescription --template $< -d $(top_srcdir)/po -o $@
else
	$(AM_V_GEN) cp -f $< $@
endif

-include $(top_srcdir)/git.mk
