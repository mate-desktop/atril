#!/usr/bin/bash

set -e
set -o pipefail

NAME="mate-desktop"
TEMP_DIR=$(mktemp -d)
OS=$(cat /etc/os-release | grep ^ID | head -n 1 | awk -F= '{ print $2}')
TAG=$1
CACHE_DIR=$2

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages to build mate-desktop
debian_requires=(
	libgirepository1.0-dev
	yelp-tools
	iso-codes
	gobject-introspection
)

fedora_requires=(
	iso-codes-devel
	gobject-introspection
)

ubuntu_requires=(
	yelp-tools
	iso-codes
)

requires=$(eval echo '${'"${OS}_requires[@]}")

infobegin "Install Depends for mate-desktop"
case ${OS} in
arch)
	#pacman --noconfirm -Syu
	#pacman --noconfirm -S ${requires[@]}
	;;
debian | ubuntu)
	apt-get update -qq
	env DEBIAN_FRONTEND=noninteractive \
		apt-get install --assume-yes --no-install-recommends ${requires[@]}
	;;
fedora)
	dnf update -y
	dnf install -y ${requires[@]}
	;;
esac
infoend

# Use cached packages first
if [ -f $CACHE_DIR/${NAME}-${TAG}.tar.xz ]; then
	echo "Found cache package, reuse it"
	tar -C / -Jxf $CACHE_DIR/${NAME}-${TAG}.tar.xz
else
	git clone --recurse-submodules https://github.com/mate-desktop/${NAME}

	# Foldable output information
	infobegin "Configure"
	cd ${NAME}
	git checkout v${TAG}
	if [[ ${OS} == "debian" || ${OS} == "ubuntu" ]]; then
		./autogen.sh --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/x86_64-linux-gnu || {
			cat config.log
			exit 1
		}
	else
		./autogen.sh --prefix=/usr || {
			cat config.log
			exit 1
		}
	fi
	infoend

	infobegin "Build"
	make -j ${JOBS}
	infoend

	infobegin "Install"
	make install
	infoend

	# Cache this package version
	infobegin "Cache"
	[ -d ${CACHE_DIR} ] || mkdir -p ${CACHE_DIR}
	make install DESTDIR=${TEMP_DIR}
	cd $TEMP_DIR
	tar -J -cf $CACHE_DIR/${NAME}-${TAG}.tar.xz *
	infoend
fi
