# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Silk iconset from famfamfam.com."
HOMEPAGE="http://www.famfamfam.com/lab/icons/silk/"
SRC_URI="http://www.famfamfam.com/lab/icons/silk/famfamfam_silk_icons_v013.zip"
LICENSE="CCPL-Attribution-2.5"
SLOT="0"
IUSE=""
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86"

src_install() {
	dodoc readme.txt
	dohtml readme.html
	
	insinto /usr/share/icons/famfamfam/silk
	doins icons/*
}