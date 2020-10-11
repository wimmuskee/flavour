# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=bdepend

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
