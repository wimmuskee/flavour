# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-r3

DESCRIPTION="Chromium uses a package of scripts, the depot_tools, to manage interaction with the Chromium source code repository and the Chromium development process."
HOMEPAGE="https://dev.chromium.org/developers/how-tos/install-depot-tools"
EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools.git"
LICENSE="GPL2"
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
