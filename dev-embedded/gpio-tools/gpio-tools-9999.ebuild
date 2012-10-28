# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit git-2

EGIT_REPO_URI="git://github.com/wimmuskee/gpio-tools.git"
DESCRIPTION="Shell library to access the GPIO, designed to be board agnostic."
HOMEPAGE="http://github.com/wimmuskee/gpio-tools"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
LICENSE="GPL-3"
# For future, make board USE flags?
IUSE="examples"
DEPEND=""
RDEPEND="${DEPEND}
	app-shells/bash"


src_install() {
	dobin bin/lsgpio
	dodoc README

	insinto /usr/share/gpio-tools
	doins gpio.sh
	doins -r boards
	doins -r mappings

	if use examples; then
		docinto examples
		dodoc examples/*
	fi
}
