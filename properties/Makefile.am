AM_CPPFLAGS=					\
	-DATRILDATADIR=\"$(pkgdatadir)\"	\
	-DMATELOCALEDIR=\"$(datadir)/locale\"	\
	-I$(top_srcdir)				\
	-I$(top_builddir)			\
	$(FRONTEND_CFLAGS)			\
	$(CAJA_CFLAGS)				\
	$(DISABLE_DEPRECATED)			\
	$(WARN_CFLAGS)

noinst_LTLIBRARIES = libevproperties.la

libevproperties_la_SOURCES=			\
	ev-properties-view.c			\
	ev-properties-view.h

if ENABLE_CAJA

cajaextension_LTLIBRARIES = libatril-properties-page.la

libatril_properties_page_la_CFLAGS = -I$(top_srcdir)
libatril_properties_page_la_SOURCES =		\
	ev-properties-main.c

libatril_properties_page_la_LIBADD = 		\
	libevproperties.la			\
	$(top_builddir)/libdocument/libatrildocument.la	\
	$(FRONTEND_LIBS)			\
	$(CAJA_LIBS)

libatril_properties_page_la_LDFLAGS = -module -avoid-version -no-undefined

extensiondir = $(datadir)/caja/extensions
extension_in_in_files = libatril-properties-page.caja-extension.desktop.in.in
extension_in_files = $(extension_in_in_files:.caja-extension.desktop.in.in=.caja-extension.desktop.in)
extension_DATA = $(extension_in_files:.caja-extension.desktop.in=.caja-extension)
$(extension_DATA): $(extension_in_files)
	$(AM_V_GEN) $(MSGFMT) --desktop --keyword=Description --template $< -d $(top_srcdir)/po -o $@

EXTRA_DIST = $(extension_in_in_files)

DISTCLEANFILES = $(extension_in_files)
CLEANFILES = $(extension_DATA)

endif # ENABLE_CAJA

-include $(top_srcdir)/git.mk
