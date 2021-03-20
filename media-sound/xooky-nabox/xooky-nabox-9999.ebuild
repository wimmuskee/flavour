# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

EGIT_REPO_URI="https://github.com/rvega/XookyNabox.git"
EGIT_SUBMODULES=()
DESCRIPTION="A C++ application for running PureData patches on embedded devices."
HOMEPAGE="https://github.com/rvega/XookyNabox"
SLOT="0"
LICENSE="all-rights-reserved"
KEYWORDS="~amd64 ~x86"
IUSE="examples"
# depend on libpd from flavour overlay
DEPEND="media-sound/libpd
	virtual/jack"
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}/${PN}-makeinclude.patch"
	"${FILESDIR}/${PN}-maincpp.patch"
	"${FILESDIR}/${PN}-maincpp-sleep.patch")

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
