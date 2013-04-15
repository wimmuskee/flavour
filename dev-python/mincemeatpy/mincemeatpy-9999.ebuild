# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils git-2

DESCRIPTION="A Python implementation of the MapReduce distributed computing framework."
HOMEPAGE="http://mincemeatpy.com/"
EGIT_REPO_URI="git://github.com/michaelfairley/mincemeatpy.git"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

src_install() {
	distutils_src_install
	
	if use examples; then
		docinto examples
		dodoc example.py
	fi
}
