# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Tool to setup and use Gentoo test chroot environments"
HOMEPAGE="https://github.com/wimmuskee/cleanstart"
SRC_URI="https://github.com/wimmuskee/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
RESTRICT="mirror"

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
	# TODO add gentoo32
}
