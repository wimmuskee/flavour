# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils

IUSE=""
if [[ ${PV} == *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
	KEYWORDS=""
	SRC_URI=""
	MY_S="${WORKDIR}/${P}/gtkevemon"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/${PV}/${PN}/archive/v${PV}.tar.gz"
fi

DESCRIPTION="A standalone skill monitoring application for EVE Online"
HOMEPAGE="http://gtkevemon.battleclinic.com"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-cpp/gtkmm:3.0
	dev-libs/libxml2
"
DEPEND="${DEPEND}
	virtual/pkgconfig
"

src_prepare() {
	sed -e 's:Categories=Game;$:Categories=Game;RolePlaying;GTK;:' \
		-i icon/${PN}.desktop || die "sed failed"
}

src_install() {
	# fixed QA notice
	sed -i "/^Encoding/d" icon/${PN}.desktop
	dobin src/${PN}
	doicon icon/${PN}.svg
	domenu icon/${PN}.desktop
	dodoc CHANGES README TODO
}
