# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# first release to get the bare minimum
# examples USE, need QT
# docs USE, need doxygen

EAPI="6"

inherit eutils

DESCRIPTION="FCam is an open-source C++ API for easy and precise control of digital cameras."
HOMEPAGE="http://fcam.garage.maemo.org/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
SRC_URI="https://garage.maemo.org/frs/download.php/9547/FCam.zip -> ${P}.zip"
RESTRICT="mirror"
DEPEND="app-arch/unzip"
RDEPEND=""

pkg_nofetch() {
	einfo "Please download FCam.zip yourself"
	einfo "from https://garage.maemo.org/frs/download.php/9547/FCam.zip and place them in ${DISTDIR}"
	einfo ""
	einfo "The website has an SSL certificate problem."
}

src_prepare() {
	epatch "${FILESDIR}/fcam-1.1.2-image_cpp_getpagesize.patch"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README license.txt
}
