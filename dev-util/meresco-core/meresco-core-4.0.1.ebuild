# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="The MERESCO core libraries."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
SLOT="0"
LICENSE="GPL2"
KEYWORDS="~amd64"
IUSE="doc"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/setuptools
	>=dev-python/weightless-core-0.7.1"


src_install() {
    distutils_src_install

    # copy docs
    if use doc; then
        dodoc doc/*.odt doc/MerescoTechnicalConcepts.txt || die "Installing docs failed."
    fi
}
