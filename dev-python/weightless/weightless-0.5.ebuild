# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Weightless is a High Performance Asynchronous Networking Library."
HOMEPAGE="http://www.weightless.io"
SRC_URI="http://www.cq2.nl/opensourcepackages/weightless-core-0.5.0-src.tar.gz"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}
    =dev-python/cq2utils-5.4*
    dev-python/pyopenssl"

S="${WORKDIR}/weightless-core-${PV}.0"

#src_unpack(){
#	distutils_src_unpack
#	
#}

src_install(){
	
    distutils_src_install

    if use examples; then
		docinto examples
        dodoc doc/make_ssl_cert.sh
    fi
}
