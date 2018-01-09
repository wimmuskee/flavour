# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit autotools

DESCRIPTION="A real-time graphical programming environment for audio and graphics processing."
HOMEPAGE="https://puredata.info/"
SRC_URI="https://github.com/${PN}/${PN}/archive/0.48-1.tar.gz"
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
S="${WORKDIR}/${PN}-0.48-1"

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
