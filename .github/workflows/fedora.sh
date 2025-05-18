#!/usr/bin/bash

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages on Fedora
requires=(
	ccache # Use ccache to speed up build
	meson  # Used for meson build
)

requires+=(
	autoconf-archive
	cairo-gobject-devel
	caja-devel
	desktop-file-utils
	djvulibre-devel
	gcc
	gcc-c++
	git
	gobject-introspection-devel
	gtk3-devel
	libXt-devel
	libglade2-devel
	libgxps-devel
	libjpeg-turbo-devel
	libsecret-devel
	libspectre-devel
	libtiff-devel
	make
	mate-common
	mate-desktop-devel
	poppler-glib-devel
	redhat-rpm-config
	texlive-lib-devel
	webkit2gtk4.1-devel
	yelp-tools
)

infobegin "Update system"
dnf update -y
infoend

infobegin "Install dependency packages"
dnf install -y ${requires[@]}
infoend
