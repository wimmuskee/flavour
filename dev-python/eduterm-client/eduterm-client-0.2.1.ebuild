# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Python library for interfacing with Eduterm"
HOMEPAGE="https://github.com/kennisnet/py-eduterm-client"
SRC_URI="https://github.com/kennisnet/py-eduterm-client/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/py-eduterm-client-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"
RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" -m unittest discover -s test || die "Test failed with ${EPYTHON}"
}
