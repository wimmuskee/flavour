# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="This module takes the VDEX-XML objects and offers an API to them."
HOMEPAGE="http://pypi.python.org/pypi/imsvdex"
SRC_URI="http://pypi.python.org/packages/source/i/imsvdex/${P}.tar.gz"
LICENSE="D-FSL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_install() {
	distutils_src_install
}
