# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-r3

DESCRIPTION="Extracts and cleans text from Wikipedia database dump."
HOMEPAGE="http://medialab.di.unipi.it/wiki/Wikipedia_Extractor"
EGIT_REPO_URI="git://github.com/bwbaugh/wikipedia-extractor.git"
EGIT_COMMIT="cf761347c0a085e92cdfa6738d62cb50e268a05f"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
DEPEND=""
RDEPEND="${DEPEND}
	=dev-lang/python-2*"


src_prepare() {
	epatch "${FILESDIR}/${PN}-shebang.patch"
}

src_install() {
	newbin WikiExtractor.py WikiExtractor
}
