# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

DESCRIPTION="Silk iconset from famfamfam.com."
HOMEPAGE="http://www.famfamfam.com/lab/icons/silk/"
SRC_URI="http://www.famfamfam.com/lab/icons/silk/famfamfam_silk_icons_v013.zip"
LICENSE="CC-BY-2.5"
SLOT="0"
IUSE=""
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86"
DOCS="readme.txt"
HTML_DOCS="readme.html"
S="${WORKDIR}"

src_install() {
	insinto /usr/share/icons/famfamfam/silk
	doins icons/*
	einstalldocs
}
