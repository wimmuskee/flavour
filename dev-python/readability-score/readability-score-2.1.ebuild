# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="https://github.com/wimmuskee/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="This Python library can calculate the readability score of a text."
HOMEPAGE="https://github.com/wimmuskee/readability-score"
LICENSE="GPL-2"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="~amd64 ~x86"
RDEPEND="
	dev-python/nltk[${PYTHON_USEDEP}]
	dev-python/pyphen[${PYTHON_USEDEP}]"
