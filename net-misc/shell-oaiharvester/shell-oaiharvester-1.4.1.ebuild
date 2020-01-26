# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

DESCRIPTION="OAI-PMH harvester built in shell."
HOMEPAGE="https://github.com/wimmuskee/shell-oaiharvester"
SRC_URI="https://github.com/wimmuskee/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="amd64 x86"
LICENSE="GPL-3"
RESTRICT="mirror"
DEPEND="sys-apps/help2man"
RDEPEND="app-arch/xz-utils
	app-shells/bash
	dev-libs/libxslt
	net-misc/curl
	sys-devel/bc"

src_prepare() {
	default
	eautoreconf
}
