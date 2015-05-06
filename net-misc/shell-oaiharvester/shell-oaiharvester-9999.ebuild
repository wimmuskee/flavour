# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools git-2

EGIT_REPO_URI="git://github.com/wimmuskee/shell-oaiharvester.git"
DESCRIPTION="OAI-PMH harvester built in shell."
HOMEPAGE="https://github.com/wimmuskee/shell-oaiharvester"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
DEPEND="sys-apps/help2man"
RDEPEND="app-arch/xz-utils
	app-shells/bash
	dev-libs/libxslt
	net-misc/curl
	sys-devel/bc"


src_prepare() {
	eautoreconf
}

src_configure() {
	./configure --prefix="${D}/usr"
}

src_install() {
	emake install || die "emake install failed."
}
