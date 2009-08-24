# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Weightless is a High Performance Asynchronous Networking Library."
HOMEPAGE="http://www.weightless.io"
SRC_URI="http://www.cq2.nl/opensourcepackages/weightless-0.4.3-src.tar.gz"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}
    =dev-python/cq2utils-5.4
    >dev-python/werkzeug-0.4.1
    dev-python/pyopenssl"
	

src_install(){
    distutils_src_install

    if use examples; then
	docinto examples
        dodoc doc/make_ssl_cert.sh
    fi
}
