# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Flag icons from famfamfam.com."
HOMEPAGE="http://www.famfamfam.com/lab/icons/flags/"
SRC_URI="http://www.famfamfam.com/lab/icons/flags/famfamfam_flag_icons.zip"
LICENSE="FreeArt"
SLOT="0"
IUSE="+png gif"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86"
REQUIRED_USE="|| ( png gif )"
BDEPEND="app-arch/unzip"
DOCS="readme.txt"
S="${WORKDIR}"

src_install() {
	default
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
