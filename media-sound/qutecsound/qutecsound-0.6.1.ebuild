# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Copied from the csound-wii overlay
# git://gitorious.org/csound-wii/csound-wii.git

EAPI=2
inherit qt4-r2

DESCRIPTION="QuteCsound is a frontend for Csound featuring a highlighting editor with autocomplete, interactive widgets and integrated help."
HOMEPAGE="http://qutecsound.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"

# PythonQt support is not currently working
DEPEND=">=media-sound/csound-5.17
    >=app-doc/csound-manual-5.17[html]
	x11-libs/qt-gui:4"
#	dev-python/PythonQt"

src_prepare() {
	local installed_csound=$(best_version media-sound/csound)
	installed_csound=${installed_csound/media-sound\//}
	ebegin "Setting html-doc directory to /usr/share/doc/${installed_csound}/html/"
	sed -i "s@/usr/local/share/doc/csound/html@/usr/share/doc/${installed_csound}/html@" src/types.h
	eend
}

src_configure() {
	if has_version media-sound/csound[double-precision]; then
		eqmake4 qcs.pro CONFIG+="build64"
		#eqmake4 qcs.pro CONFIG+="build64 pythonqt"
	else
		eqmake4 qcs.pro
		#eqmake4 qcs.pro CONFIG+="pythonqt"
	fi
}

src_compile() {
	emake
}

src_install() {
	dodoc ChangeLog
	if has_version media-sound/csound[double-precision]; then
		newbin bin/qutecsound-d qutecsound
	else
		newbin bin/qutecsound-f qutecsound
	fi
	if use doc; then
		insinto /usr/share/doc/${PF}/pdf
		doins doc/*.pdf
		insinto /usr/share/doc/${PF}/odt
		doins doc/*.odt
	fi
	insinto /usr/share/pixmaps
	doins images/qtcs.png images/qtcs.svg
	make_desktop_entry qutecsound QuteCsound qtcs
}
