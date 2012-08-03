# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Flag icons from famfamfam.com."
HOMEPAGE="http://www.famfamfam.com/lab/icons/flags/"
SRC_URI="http://www.famfamfam.com/lab/icons/flags/famfamfam_flag_icons.zip"
LICENSE="FreeArt"
SLOT="0"
IUSE="+png gif"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86"

src_install() {
	dodoc readme.txt
	dest="/usr/share/icons/famfamfam/flags"

	if use png; then
		insinto ${dest}/png
		doins png/*
	fi
	
	if use gif; then
		insinto ${dest}/gif
		doins gif/*
	fi
}