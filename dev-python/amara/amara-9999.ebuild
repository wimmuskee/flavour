# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit mercurial distutils

EHG_REPO_URI="http://hg.xml3k.org/amara"

DESCRIPTION="Python tools for XML processing."
HOMEPAGE="http://wiki.xml3k.org/Amara/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"

DEPEND="doc? ( dev-python/epydoc )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
    mercurial_src_unpack
}

src_install() {
    distutils_src_install

    dodoc README

    if use examples; then
	insinto /usr/share/${PN}
	doins -r demo
    fi

    if use doc; then
	dodoc doc/manual.rst
	epydoc lib && dohtml -r html/*
    fi
}