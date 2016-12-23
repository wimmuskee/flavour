# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Scripts to setup and use Gentoo test chroot environments"
HOMEPAGE="https://github.com/wimmuskee/cleanstart"
EGIT_REPO_URI="git://github.com/wimmuskee/cleanstart.git"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"

src_install() {
	default

	dobin cleanstart-create
	dobin cleanstart-chroot

	insinto /usr/share/cleanstart
	doins share/*

	insinto /etc/cleanstart
	doins config/cleanstart.conf

	insinto /etc/cleanstart/profiles
	doins config/profile.default
}
