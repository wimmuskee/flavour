# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-2

EGIT_REPO_URI="git://github.com/rvega/XookyNabox.git"

DESCRIPTION="A C++ application for running PureData patches on embedded devices."
HOMEPAGE="https://github.com/rvega/XookyNabox"
IUSE=""
SLOT="0"
KEYWORDS=""
# depend on libpd from flavour overlay
DEPEND="media-sound/libpd"

src_prepare() {
	epatch "${FILESDIR}/${PN}-makeinclude.patch"
}

src_compile() {
	cd "${S}/src"
	emake || die "emake failed"
}

# does not compile
