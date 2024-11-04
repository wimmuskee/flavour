# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Python class for reading and writing IMS-LOM records."
HOMEPAGE="https://github.com/kennisnet/pylom"
SRC_URI="https://github.com/kennisnet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86"
IUSE="test"
RESTRICT="mirror"
DEPEND="test? (
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}] )"
RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]"

distutils_enable_tests unittest
