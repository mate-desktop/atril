SUBDIRS = reference

@YELP_HELP_RULES@

HELP_ID = atril

HELP_MEDIA = figures/atril.png \
	figures/atril-trail.png

HELP_FILES = \
	annotation-properties.page	\
	annotations-delete.page		\
	annotations-disabled.page	\
	annotations-navigate.page	\
	annotations.page		\
	annotations-save.page		\
	bookmarks.page			\
	bug-filing.page			\
	commandline.page		\
	convertpdf.page			\
	convertPostScript.page		\
	convertSVG.page			\
	default-settings.page		\
	develop.page			\
	documentation.page		\
	duplex-npages.page		\
	editing.page			\
	finding.page			\
	formats.page			\
	forms.page			\
	forms-saving.page		\
	index.page			\
	introduction.page		\
	invert-colors.page		\
	license.page			\
	legal.xml			\
	legal-unported.xml \
	movingaround.page		\
	noprint.page			\
	openerror.page			\
	opening.page			\
	password.page			\
	presentations.page		\
	print-2sided.page		\
	print-booklet.page		\
	print-differentsize.page	\
	printing.page			\
	print-pagescaling.page		\
	reload.page			\
	shortcuts.page			\
	singlesided-npages.page		\
	synctex-beamer.page		\
	synctex-compile.page		\
	synctex-editors.page		\
	synctex.page			\
	synctex-search.page		\
	synctex-support.page		\
	textselection.page		\
	translate.page

# Add linguas to be ignored, e.g. IGNORE_HELP_LINGUAS = ca de es fr
if USE_NLS
IGNORE_HELP_LINGUAS =
HELP_LINGUAS = $(if $(IGNORE_HELP_LINGUAS), \
	$(filter-out $(IGNORE_HELP_LINGUAS),$(subst /,,$(dir $(wildcard */*.po)))), \
	$(subst /,,$(dir $(wildcard */*.po))) )
else
HELP_LINGUAS =
endif

DISTCLEANFILES = \
	Makefile.in

-include $(top_srcdir)/git.mk
