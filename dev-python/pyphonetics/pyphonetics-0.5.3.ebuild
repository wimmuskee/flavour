# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A Python 3 library for phonetic algorithms"
HOMEPAGE="https://github.com/Lilykos/pyphonetics"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="test"

RDEPEND="=dev-python/unidecode-1*[${PYTHON_USEDEP}]"
BDEPEND="
	test? ( ${RDEPEND} )"

distutils_enable_tests pytest
