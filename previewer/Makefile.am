
bin_PROGRAMS = atril-previewer

man_MANS = atril-previewer.1

atril_previewer_SOURCES = \
	ev-previewer.c		\
	ev-previewer-resources.c \
	ev-previewer-window.h	\
	ev-previewer-window.c \
	$(NULL)

atril_previewer_CPPFLAGS = \
	-I$(top_srcdir)                         \
	-I$(top_builddir) 			\
        -I$(top_srcdir)/libdocument             \
        -I$(top_srcdir)/libview                 \
	-I$(top_srcdir)/libmisc			\
	$(AM_CPPFLAGS)

atril_previewer_CFLAGS = \
	$(PREVIEWER_CFLAGS)			\
        $(WARN_CFLAGS)                          \
        $(DISABLE_DEPRECATED)			\
	$(AM_CFLAGS)

atril_previewer_LDFLAGS = $(AM_LDFLAGS)

atril_previewer_LDADD = \
	$(top_builddir)/libdocument/libatrildocument.la	\
	$(top_builddir)/libview/libatrilview.la		\
	$(top_builddir)/libmisc/libevmisc.la		\
	$(PREVIEWER_LIBS)

ev-previewer-resources.c: previewer.gresource.xml Makefile $(shell $(GLIB_COMPILE_RESOURCES) --generate-dependencies --sourcedir $(srcdir) $(srcdir)/previewer.gresource.xml)
	$(AM_V_GEN) XMLLINT=$(XMLLINT) $(GLIB_COMPILE_RESOURCES) --target $@ --sourcedir $(srcdir) --generate-source --c-name ev_previewer $<

EXTRA_DIST = \
	previewer.gresource.xml \
	previewer-ui.xml \
	$(man_MANS) \
	$(NULL)

CLEANFILES = \
	ev-previewer-resources.c \
	$(NULL)

-include $(top_srcdir)/git.mk
