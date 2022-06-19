# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# dependency for python-OBD, for more version look at stuff overlay
EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Operate and manipulate physical quantities in Python"
HOMEPAGE="https://github.com/hgrecco/pint https://pint.readthedocs.io"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# test has other dependencies, not implemented
RESTRICT="mirror test"
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]"
