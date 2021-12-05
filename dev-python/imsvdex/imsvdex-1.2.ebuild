# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="This module takes the VDEX-XML objects and offers an API to them."
HOMEPAGE="https://github.com/collective/imsvdex"
SRC_URI="https://github.com/collective/imsvdex/archive/1.2.tar.gz -> ${P}.tar.gz"
LICENSE="D-FSL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="mirror
	!test? ( test )"
IUSE="test"
RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
BDEPEND="test? ( ${RDEPEND} )"

python_test() {
	"${PYTHON}" -m unittest discover -s imsvdex/tests || die "Test failed with ${EPYTHON}"
}
