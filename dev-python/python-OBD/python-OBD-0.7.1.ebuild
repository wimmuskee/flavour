# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Serial module for handling live sensor data from a vehicle's OBD-II port"
HOMEPAGE="https://github.com/brendan-w/python-OBD https://python-obd.readthedocs.io"
SRC_URI="https://github.com/brendan-w/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
DEPEND="test? (
	>=dev-python/Pint-0.19[${PYTHON_USEDEP}]
	<dev-python/Pint-0.20[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3[${PYTHON_USEDEP}] )"

RDEPEND="
	>=dev-python/Pint-0.19[${PYTHON_USEDEP}]
	<dev-python/Pint-0.20[${PYTHON_USEDEP}]
	>=dev-python/pyserial-3[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
