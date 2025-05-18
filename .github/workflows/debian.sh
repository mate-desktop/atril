#!/usr/bin/bash

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages on Debian
requires=(
	ccache # Use ccache to speed up build
	meson  # Used for meson build
)

requires+=(
	at-spi2-core
	autopoint
	git
	gobject-introspection
	libcaja-extension-dev
	libdjvulibre-dev
	libgail-3-dev
	libgirepository1.0-dev
	libglib2.0-dev
	libgtk-3-dev
	libgxps-dev
	libkpathsea-dev
	libmate-desktop-dev
	libpoppler-glib-dev
	libsecret-1-dev
	libsm-dev
	libspectre-dev
	libsynctex-dev
	libtiff-dev
	libwebkit2gtk-4.1-dev
	libx11-dev
	libxml2-dev
	lsb-release
	make
	mate-common
	xsltproc
	yelp-tools
	zlib1g-dev
)

infobegin "Update system"
apt-get update -qq
infoend

infobegin "Install dependency packages"
env DEBIAN_FRONTEND=noninteractive \
	apt-get install --assume-yes \
	${requires[@]}
infoend
