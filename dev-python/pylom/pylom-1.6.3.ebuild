# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="https://github.com/kennisnet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Python class for reading and writing IMS-LOM records."
HOMEPAGE="https://github.com/kennisnet/pylom"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="amd64 ~arm ~arm64 x86"
IUSE="test"
DEPEND="test? (
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}] )"
RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]"

distutils_enable_tests unittest
