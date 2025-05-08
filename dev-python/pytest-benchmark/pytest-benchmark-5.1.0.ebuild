# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="A pytest fixture for benchmarking code"
HOMEPAGE="https://github.com/ionelmc/pytest-benchmark"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV}")"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# implementing tests is not trivial
RESTRICT="mirror test"
RDEPEND="
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]"
