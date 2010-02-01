# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit mercurial distutils

EHG_REPO_URI="http://hg.xml3k.org/amara"

DESCRIPTION="Python tools for XML processing."
HOMEPAGE="http://wiki.xml3k.org/Amara2/"
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