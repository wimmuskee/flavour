# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Operate and manipulate physical quantities in Python"
HOMEPAGE="https://github.com/hgrecco/pint https://pint.readthedocs.io"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN,,}" "${PV}")"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
RDEPEND="
	>=dev-python/flexcache-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/flexparser-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-subtests[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
