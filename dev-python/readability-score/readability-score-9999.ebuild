# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils git-2

EGIT_REPO_URI="git://github.com/wimmuskee/readability-score.git"
DESCRIPTION="This Python library can calculate the readability score of a text."
HOMEPAGE="http://github.com/wimmuskee/readability-score"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="dev-python/nltk
	dev-python/hyphenator
	app-dicts/myspell-nl"