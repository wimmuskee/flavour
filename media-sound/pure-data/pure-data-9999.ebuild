# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools git-r3

DESCRIPTION="A real-time graphical programming environment for audio and graphics processing."
HOMEPAGE="https://puredata.info/"
EGIT_REPO_URI="https://github.com/pure-data/pure-data.git"
SLOT="0"
LICENSE="BSD"
KEYWORDS=""
RESTRICT="mirror"
IUSE="jack nls +oss portmidi"
REQUIRED_USE="portmidi? ( !oss )"
DOCS=( "LICENSE.txt" "README.txt" )
DEPEND="
	media-libs/alsa-lib
	sys-libs/glibc
	jack? ( virtual/jack )
	nls? ( sys-devel/gettext )
	portmidi? ( media-libs/portmidi )
"
RDEPEND="${DEPEND}
	dev-lang/tcl
	dev-lang/tk
"

PATCHES=(
	"${FILESDIR}/${P}-configure-oss.patch"
)

src_prepare() {
	default
	mkdir -p "${S}/m4/generated"
	eautoreconf
}

src_configure() {
	#  insecure RUNPATHs in portaudio, so disable for now
	# portmidi, also disable usage of locally provided portmidi
	econf --disable-portaudio \
		$(use_enable jack) \
		$(use_enable nls locales) \
		$(use_enable oss) \
		$(use_enable portmidi) \
		$(use_with !portmidi local-portmidi) 
}
