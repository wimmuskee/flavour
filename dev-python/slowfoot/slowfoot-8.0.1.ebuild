# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils
inherit eutils

DESCRIPTION="Slowfoot is an integration system for web-based applications."
HOMEPAGE="http://sources.seecr.nl/sources"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
IUSE="examples"
KEYWORDS="~amd64 ~x86"
DOCS="CHANGES"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
	www-apache/mod_python
	=dev-python/amara-1.2.0.2"

pkg_setup() {
	enewgroup slowfoot
}

src_install() {
	distutils_src_install

	# copy examples
	if use examples; then
    	docinto "examples"
		dodoc examples/*.* || die "Installing examples failed."
		docinto "templates"
		dodoc examples/templates/* || die "Installing templates failed."
	fi
}
