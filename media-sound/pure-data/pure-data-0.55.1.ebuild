# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit autotools

DESCRIPTION="A real-time graphical programming environment for audio and graphics processing."
HOMEPAGE="https://puredata.info/"
SRC_URI="https://github.com/${PN}/${PN}/archive/$(ver_cut 1-2)-1.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-0.55-1"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alsa fftw jack nls +oss portaudio portmidi"
RESTRICT="mirror"
REQUIRED_USE="portmidi? ( !oss )"
DOCS=( "LICENSE.txt" "README.txt" )
DEPEND="
	sys-libs/glibc
	alsa? ( media-libs/alsa-lib )
	fftw? ( sci-libs/fftw )
	jack? ( virtual/jack )
	nls? ( sys-devel/gettext )
	portaudio? ( media-libs/portaudio )
	portmidi? ( media-libs/portmidi )
"
RDEPEND="${DEPEND}
	dev-lang/tcl
	dev-lang/tk
"

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
		$(use_with !portaudio local-portaudio) \
		$(use_enable fftw)
}
