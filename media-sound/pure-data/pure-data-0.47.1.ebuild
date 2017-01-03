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
DEPEND="sys-devel/gettext
	sys-libs/glibc"
RDEPEND="media-libs/alsa-lib
	dev-lang/tcl
	dev-lang/tk
	jack? ( virtual/jack )
"

src_prepare() {
	mv "${S}/portaudio/configure.in" "${S}/portaudio/configure.ac"

	default
	mkdir -p "${S}/m4/generated"
	eautoreconf
}

src_configure() {
	#  insecure RUNPATHs in portaudio, so disable for now
	econf --disable-portaudio \
		$(use_enable jack)
}
