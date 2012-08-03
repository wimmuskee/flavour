# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

EBZR_REPO_URI="http://bazaar.launchpad.net/~wimmuskee/infoflux/trunk"

inherit bzr webapp

DESCRIPTION="The Infoflux framework aims to provide developers with an abstraction layer for various data sources."
HOMEPAGE="http://launchpad.net/infoflux"
LICENSE="GPL-2"
SLOT="0"
WEBAPP_MANUAL_SLOT="yes"
KEYWORDS=""
IUSE=""
DEPEND=">dev-lang/php-5.2"

src_unpack() {
	bzr_src_unpack
}

src_install() {
	# tool
	newbin libs/bin/infoflux-tools.sh infoflux-tools
	
	# webapp
	webapp_src_preinst
	cp -R libs template ${D}/${MY_HTDOCSDIR}
	webapp_src_install
}