# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

SRC_URI="https://github.com/kennisnet/py-eduterm-client/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Python library for interfacing with Eduterm"
HOMEPAGE="https://github.com/kennisnet/py-eduterm-client"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="amd64 x86"
RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
S="${WORKDIR}/py-eduterm-client-${PV}"

python_test() {
	"${PYTHON}" -m unittest discover -s test || die "Test failed with ${EPYTHON}"
}
