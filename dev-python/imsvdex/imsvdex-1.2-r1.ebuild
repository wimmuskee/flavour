# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="This module takes the VDEX-XML objects and offers an API to them."
HOMEPAGE="https://github.com/collective/imsvdex"
SRC_URI="https://github.com/collective/imsvdex/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="D-FSL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="test"
RESTRICT="mirror
	!test? ( test )"
RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
BDEPEND="test? ( ${RDEPEND} )"

src_prepare() {
	eapply "${FILESDIR}/${PN}-${PV}-assertequal.patch"
	eapply_user
}

python_test() {
	"${PYTHON}" -m unittest discover -s imsvdex/tests || die "Test failed with ${EPYTHON}"
}
