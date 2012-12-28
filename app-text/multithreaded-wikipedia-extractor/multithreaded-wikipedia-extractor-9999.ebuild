# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mercurial

DESCRIPTION="Extracts and cleans text from Wikipedia database dump."
HOMEPAGE="https://bitbucket.org/leonardossz/multithreaded-wikipedia-extractor"
EHG_REPO_URI="https://bitbucket.org/leonardossz/multithreaded-wikipedia-extractor"
SLOT="0"
KEYWORDS="~amd64"
LICENSE="GPL-1"
RESTRICT="mirror"
#S="${WORKDIR}/leonardossz-${PN}-b32baff0db52"
DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/python[threads]
	dev-python/lxml
	virtual/python-argparse"


src_install() {
	newbin WikiExtractor.py WikiExtractor
}
