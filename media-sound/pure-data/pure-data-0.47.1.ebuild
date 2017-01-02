# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools

DESCRIPTION="A real-time graphical programming environment for audio and graphics processing."
HOMEPAGE="https://puredata.info/"
SRC_URI="https://github.com/${PN}/${PN}/archive/0.47-1.tar.gz"
SLOT="0"
LICENSE="BSD"
KEYWORDS=""
RESTRICT="mirror"
IUSE="jack"
S="${WORKDIR}/${PN}-0.47-1"
DOCS=( "LICENSE.txt" "README.txt" )
DEPEND=""
RDEPEND="media-libs/alsa-lib
	dev-lang/tcl
	dev-lang/tk
	jack? ( virtual/jack )
"

src_prepare() {
	default
	mkdir -p "${S}/m4/generated"
	eautoreconf
}

src_configure() {
	local myconf

	#  insecure RUNPATHs in portaudio
	myconf="${myconf} --disable-portaudio"

	if use jack; then
		myconf="${myconf} --enable-jack"
	fi

	./configure --prefix="${D}/usr" ${myconf}
}

src_install() {
	emake DESTDIR="${D}" prefix="/usr" install || die "make install failed"
	einstalldocs
}
