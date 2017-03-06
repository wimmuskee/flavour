# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_{4,5}} )

inherit python-single-r1 git-r3

DESCRIPTION="Extracts and cleans text from Wikipedia database dump."
HOMEPAGE="http://medialab.di.unipi.it/wiki/Wikipedia_Extractor"
EGIT_REPO_URI="git://github.com/attardi/wikiextractor.git"
EGIT_COMMIT="5414b7fda84ff65ed5564e4427f6c49a9ab810c8"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_install() {
	default
	python_doscript WikiExtractor.py
	dosym WikiExtractor.py /usr/bin/WikiExtractor
}
