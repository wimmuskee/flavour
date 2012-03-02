# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils subversion

DESCRIPTION="Weightless is a High Performance Asynchronous Networking Library."
HOMEPAGE="http://www.weightless.io"
ESVN_REPO_URI="https://weightless.svn.sourceforge.net/svnroot/weightless/weightless-core/tags/version_0.7.2"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/pyopenssl"

src_unpack() {
	subversion_src_unpack
}

src_install(){
	
    distutils_src_install

    if use examples; then
		docinto examples
        dodoc doc/*
    fi
}
