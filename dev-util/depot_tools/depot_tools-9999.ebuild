# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3

DESCRIPTION="Tools for working with Chromium development."
HOMEPAGE="https://dev.chromium.org/developers/how-tos/install-depot-tools"
EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="app-admin/sudo"

src_install() {
	dobin repo
	dobin support/chromite_wrapper

	insinto /usr/bin
	dosym chromite_wrapper /usr/bin/cros_sdk
}
