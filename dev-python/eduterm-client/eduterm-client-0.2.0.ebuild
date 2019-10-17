# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{2_7,3_{5,6,7}} )

inherit distutils-r1

SRC_URI="https://github.com/kennisnet/py-eduterm-client/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Python library for interfacing with Eduterm"
HOMEPAGE="https://github.com/kennisnet/py-eduterm-client"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="amd64 x86"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
S="${WORKDIR}/py-eduterm-client-${PV}"

python_test() {
	"${PYTHON}" -m unittest discover -s test || die "Test failed with ${EPYTHON}"
}
