# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Dropbox Daemon"
HOMEPAGE="http://www.dropbox.com/"
SRC_URI="amd64? ( http://dl-web.dropbox.com/u/17/${PN}-lnx.x86_64-${PV}.tar.gz )
	x86? ( http://dl-web.dropbox.com/u/17/${PN}-lnx.x86-${PV}.tar.gz )"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	=dev-python/ncrypt-0.6.4
	=dev-python/netifaces-0.5"
	
http://wiki.dropbox.com/TipsAndTricks/TextBasedLinuxInstall/GentooStartup
http://wiki.dropbox.com/TipsAndTricks/TextBasedLinuxInstall