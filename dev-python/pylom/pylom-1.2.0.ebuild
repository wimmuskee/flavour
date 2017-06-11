# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1

SRC_URI="https://github.com/kennisnet/${PN}/archive/${PV}.tar.gz"
DESCRIPTION="Python class for reading IMS-LOM records."
HOMEPAGE="https://github.com/kennisnet/pylom"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="
	dev-python/lxml"

