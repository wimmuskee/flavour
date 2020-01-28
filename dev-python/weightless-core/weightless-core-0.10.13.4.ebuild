# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python2_7 )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

DESCRIPTION="Weightless is a High Performance Asynchronous Networking Library."
HOMEPAGE="https://github.com/seecr/weightless-core"
SRC_URI="https://github.com/seecr/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="examples"
RDEPEND="dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"

src_install(){
	distutils-r1_src_install

	if use examples; then
		docinto examples
		dodoc doc/*
	fi
}
