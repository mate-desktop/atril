SUBDIRS = icons
NULL=

install-data-local: update-icon-cache

#
# man file
#

man_MANS=atril.1

#
# UI descriptions
#

uidir = $(pkgdatadir)
ui_DATA = \
	hand-open.png

#
# Desktop file
#

desktopdir = $(datadir)/applications
desktop_in_files = atril.desktop.in
desktop_DATA = $(desktop_in_files:.desktop.in=.desktop)
$(desktop_DATA): $(desktop_in_files)
if USE_NLS
	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@
else
	$(AM_V_GEN) cp -f $< $@
endif

#
# DBus servide file
#

if ENABLE_DBUS
servicedir = $(datadir)/dbus-1/services
service_in_files = org.mate.atril.Daemon.service.in
service_DATA = $(service_in_files:.service.in=.service)

$(service_DATA): $(service_in_files) Makefile
	$(AM_V_GEN) $(SED) -e "s|\@libexecdir\@|$(libexecdir)|" $< > $@
endif

#
# App data file
#

appdatadir = $(datadir)/metainfo
appdata_in_in_files = atril.appdata.xml.in.in
appdata_in_files = $(appdata_in_in_files:.appdata.xml.in.in=.appdata.xml.in)
appdata_DATA = $(appdata_in_files:.xml.in=.xml)
$(appdata_DATA): $(appdata_in_files)
if USE_NLS
	$(AM_V_GEN) $(MSGFMT) --xml --template $< -d $(top_srcdir)/po -o $@
else
	$(AM_V_GEN) cp -f $< $@
endif

#
# GSettings schema
#

gsettings_SCHEMAS = org.mate.Atril.gschema.xml

.PRECIOUS: $(gsettings_SCHEMAS)

# include the appropriate makefile rules for schema handling
@GSETTINGS_RULES@

#
# GTK icon cache
#

gtk_update_icon_cache = gtk-update-icon-cache -f -t $(datadir)/icons/hicolor

install-data-hook: update-icon-cache
uninstall-hook: update-icon-cache

update-icon-cache:
	if test -z "$(DESTDIR)"; then \
	        echo "Updating Gtk icon cache."; \
	        $(gtk_update_icon_cache); \
	else \
	        echo "*** Icon cache not updated.  After (un)install, run this:"; \
	        echo "***   $(gtk_update_icon_cache)"; \
	        fi

#
# Extra files to be included in the tarball
#

EXTRA_DIST =					\
	$(appdata_in_in_files)			\
	$(desktop_in_files)			\
	$(gsettings_SCHEMAS)			\
	$(man_MANS)				\
	$(service_in_files)			\
	$(ui_DATA)				\
	org.mate.atril.Daemon.service.in	\
	$(NULL)

#
# Clean up properly
#

CLEANFILES = \
	$(appdata_DATA)		\
	$(desktop_DATA)		\
	$(service_DATA)		\
	$(NULL)

DISTCLEANFILES = \
	$(appdata_in_files)	\
	$(NULL)

-include $(top_srcdir)/git.mk
