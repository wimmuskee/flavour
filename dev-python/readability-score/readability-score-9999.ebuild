# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="git://github.com/wimmuskee/readability-score.git"
DESCRIPTION="This Python library can calculate the readability score of a text."
HOMEPAGE="http://github.com/wimmuskee/readability-score"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND+="
	dev-python/nltk
	dev-python/pyphen"
