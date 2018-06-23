# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

SRC_URI="https://github.com/kennisnet/py-eduterm-client/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Python class for reading and writing IMS-LOM records."
HOMEPAGE="https://github.com/kennisnet/py-eduterm-client"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/requests"
S="${WORKDIR}/py-eduterm-client-${PV}"

python_test() {
	"${PYTHON}" -m unittest discover -s test || die "Test failed with ${EPYTHON}"
}
