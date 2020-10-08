# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/wimmuskee/readability-score.git"
DESCRIPTION="This Python library can calculate the readability score of a text."
HOMEPAGE="https://github.com/wimmuskee/readability-score"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RDEPEND="
	dev-python/nltk[${PYTHON_USEDEP}]
	dev-python/pyphen[${PYTHON_USEDEP}]"
