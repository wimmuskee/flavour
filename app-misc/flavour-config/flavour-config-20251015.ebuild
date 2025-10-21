# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Flavour configuration files."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
# git-branch-color uses tput from ncurses
RDEPEND="app-shells/bash
	sys-libs/ncurses"

src_unpack() {
	mkdir "${WORKDIR}/${P}"
}

src_install() {
	default

	insinto /etc
	newins "${FILESDIR}"/locale-flavour.gen locale-flavour.gen

	insinto /etc/bash/bashrc.d
	newins "${FILESDIR}"/20-flavour-git-branch-color.bash 20-flavour-git-branch-color.bash

	doman "${FILESDIR}"/flavour-gentoo-docs.7
}
