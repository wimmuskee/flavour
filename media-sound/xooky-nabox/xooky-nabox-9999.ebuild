# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-2

EGIT_REPO_URI="git://github.com/rvega/XookyNabox.git"

DESCRIPTION="A C++ application for running PureData patches on embedded devices."
HOMEPAGE="http://github.com/rvega/XookyNabox"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples"
# depend on libpd from flavour overlay
DEPEND="media-sound/libpd
	media-sound/jack-audio-connection-kit"
RDEPEND="${DEPEND}"


src_prepare() {
	epatch "${FILESDIR}/${PN}-makeinclude.patch"
	epatch "${FILESDIR}/${PN}-maincpp.patch"
}

src_compile() {
	cd "${S}/src"
	emake || die "emake failed"
}

src_install() {
	dobin bin/xooky_nabox
	dodoc README

	if use examples; then
		docinto patches
		dodoc patches/*
	fi
}
