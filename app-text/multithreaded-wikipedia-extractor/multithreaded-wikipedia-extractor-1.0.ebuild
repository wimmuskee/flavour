# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Extracts and cleans text from Wikipedia database dump."
HOMEPAGE="https://bitbucket.org/leonardossz/multithreaded-wikipedia-extractor"
SRC_URI="https://bitbucket.org/leonardossz/multithreaded-wikipedia-extractor/get/v1.0.0.zip"
SLOT="0"
KEYWORDS="~amd64"
LICENSE="GPL-1"
RESTRICT="mirror"
S="${WORKDIR}/leonardossz-${PN}-b32baff0db52"
DEPEND=""
RDEPEND="${DEPEND}
	=dev-lang/python-2*[threads]
	dev-python/lxml
	virtual/python-argparse"


src_prepare() {
	epatch "${FILESDIR}/${PN}-shebang.patch"
}

src_install() {
	newbin WikiExtractor.py WikiExtractorMultithreaded
}
