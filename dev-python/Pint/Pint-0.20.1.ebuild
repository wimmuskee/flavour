# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# dependency for python-OBD, for more versions look at stuff overlay
EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Operate and manipulate physical quantities in Python"
HOMEPAGE="https://github.com/hgrecco/pint https://pint.readthedocs.io"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN^}" "${PV}")"
S=${WORKDIR}/${P^}
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# test has other dependencies, not implemented
RESTRICT="mirror test"
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]"
