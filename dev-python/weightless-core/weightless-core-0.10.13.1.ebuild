# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Weightless is a High Performance Asynchronous Networking Library."
HOMEPAGE="https://github.com/seecr/weightless-core"
SRC_URI="https://github.com/seecr/${PN}/archive/${PV}.zip -> ${P}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="examples"
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pyopenssl"

src_install(){
	distutils-r1_src_install

	if use examples; then
		docinto examples
		dodoc doc/*
	fi
}
