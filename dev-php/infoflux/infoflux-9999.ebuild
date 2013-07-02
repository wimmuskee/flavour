# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EBZR_REPO_URI="http://bazaar.launchpad.net/~wimmuskee/infoflux/trunk"

inherit bzr

DESCRIPTION="The Infoflux framework aims to provide developers with an abstraction layer for data sources."
HOMEPAGE="http://launchpad.net/infoflux"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc"
RDEPEND=">dev-lang/php-5.2
	doc? (
		app-text/robodoc
		app-text/xmlto )"

src_unpack() {
	bzr_src_unpack
}

src_install() {
	insinto /usr/share/infoflux

	# binaries
	dobin libs/bin/infoflux-deploy
	dobin libs/bin/infoflux-process
	dobin libs/bin/infoflux-tools

	# stuff
	doins libs/bin/process-functions.sh
	doins libs/config.xml
	rm -f libs/config.xml
	rm -rf libs/bin

	# docs
	if ! use doc; then
		rm -rf libs/doc
	fi

	# main libraries and templates
	doins -r libs
	doins -r template
}
