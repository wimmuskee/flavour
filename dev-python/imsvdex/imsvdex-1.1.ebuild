# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="This module takes the VDEX-XML objects and offers an API to them."
HOMEPAGE="https://pypi.python.org/pypi/imsvdex"
SRC_URI="https://pypi.python.org/packages/1e/fa/8f52abb58f1a48fa688a6b94bb99eef185a80b555b785520e300e23209e8/${P}.zip"
LICENSE="D-FSL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/lxml"
