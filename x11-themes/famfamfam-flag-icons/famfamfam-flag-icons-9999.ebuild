# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Flag icons from famfamfam.com."
HOMEPAGE="http://www.famfamfam.com/lab/icons/flags/"
SRC_URI="http://www.famfamfam.com/lab/icons/flags/famfamfam_flag_icons.zip"
LICENSE="public-domain"
SLOT="0"
IUSE="+png gif"
KEYWORDS="amd64 arm arm64 hppa m68k mips ppc ppc64 s390 sparc x86"
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
