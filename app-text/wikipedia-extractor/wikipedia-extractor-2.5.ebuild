# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-r3

DESCRIPTION="Extracts and cleans text from Wikipedia database dump."
HOMEPAGE="http://medialab.di.unipi.it/wiki/Wikipedia_Extractor"
EGIT_REPO_URI="git://github.com/bwbaugh/wikipedia-extractor.git"
EGIT_COMMIT="b891647abd3f9b3a86a05f0327e1f9222d3230db"
SLOT="0"
KEYWORDS="~amd64"
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
