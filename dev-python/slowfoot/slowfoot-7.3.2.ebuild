# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils
inherit eutils

DESCRIPTION="Slowfoot is an integration system for web-based applications."
HOMEPAGE="http://www.cq2.nl/sources"
SRC_URI="http://www.cq2.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
IUSE="examples"
KEYWORDS="~amd64 ~x86"
DOCS="CHANGES"

DEPEND=""

RDEPEND="${DEPEND}
	www-apache/mod_python
	=dev-python/cq2utils-old-5.4*"

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
