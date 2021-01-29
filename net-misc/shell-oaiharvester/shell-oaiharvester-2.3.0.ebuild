# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

DESCRIPTION="OAI-PMH harvester built in shell"
HOMEPAGE="https://github.com/wimmuskee/shell-oaiharvester"
SRC_URI="https://github.com/wimmuskee/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
LICENSE="GPL-3"
RESTRICT="mirror
	!test? ( test )"
IUSE="test validation"

RDEPEND="
	app-shells/bash:*
	dev-libs/libxslt
	net-misc/curl
	sys-apps/grep
	sys-apps/sed
	validation? ( dev-libs/libxml2 )
"
DEPEND="sys-apps/help2man
	test? ( ${RDEPEND} )"

src_prepare() {
	default
	eautoreconf
}

src_test() {
	./test.sh || die "Test failed"
}
