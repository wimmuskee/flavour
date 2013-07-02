# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2 linux-info

EGIT_REPO_URI="git://github.com/wimmuskee/gpio-tools.git"
DESCRIPTION="Shell library to access the GPIO, designed to be board agnostic."
HOMEPAGE="http://github.com/wimmuskee/gpio-tools"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
LICENSE="GPL-3"
# For future, make board, lcd USE flags?
IUSE="examples"
DEPEND=""
RDEPEND="${DEPEND}
	app-shells/bash
	sys-devel/bc"

pkg_pretend() {
	linux_config_exists || die "No kernel config found"
	linux_chkconfig_present GENERIC_GPIO || die "GENERIC_GPIO is not set in kernel"
}

src_install() {
	if linux_chkconfig_present DEBUG_FS; then
		dobin bin/lsgpio
	fi

	insinto /usr/share/gpio-tools
	doins gpio.sh
	doins -r boards
	doins -r libraries
	doins -r mappings

	dodoc README

	if use examples; then
		docinto examples
		dodoc examples/*
	fi
}
