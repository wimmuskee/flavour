# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/kennisnet/pylom.git"
DESCRIPTION="Python class for reading and writing IMS-LOM records."
HOMEPAGE="https://github.com/kennisnet/pylom"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/lxml"

python_test() {
	"${PYTHON}" -m unittest discover -s test || die "Test failed with ${EPYTHON}"
}
