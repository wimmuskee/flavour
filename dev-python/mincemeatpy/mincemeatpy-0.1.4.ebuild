# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A Python implementation of the MapReduce distributed computing framework."
HOMEPAGE="http://mincemeatpy.com/"
SRC_URI="https://github.com/michaelfairley/mincemeatpy/archive/v${PV}.tar.gz"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

src_install() {
	distutils-r1_src_install
	
	if use examples; then
		docinto examples
		dodoc example.py
	fi
}
