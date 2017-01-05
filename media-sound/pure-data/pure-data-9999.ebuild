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
RESTRICT="${RESTRICT} mirror"
IUSE="+alsa jack nls +oss portaudio portmidi"
REQUIRED_USE="portmidi? ( !oss )"
DOCS=( "LICENSE.txt" "README.txt" )
DEPEND="
	sys-libs/glibc
	alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )
	nls? ( sys-devel/gettext )
	portaudio? ( media-libs/portaudio )
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
	# portmidi and portaudio, also disable usage of locally provided code
	econf \
		$(use_enable alsa) \
		$(use_enable jack) \
		$(use_enable nls locales) \
		$(use_enable oss) \
		$(use_enable portmidi) \
		$(use_with !portmidi local-portmidi) \
		$(use_enable portaudio) \
		$(use_with !portaudio local-portaudio)
}
