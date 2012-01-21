# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Bash Shell Function Library"
HOMEPAGE="http://code.google.com/p/bsfl"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://bsfl.googlecode.com/files/${PN}-2.00-beta-2.tgz"
RESTRICT="mirror"
RDEPEND="app-shells/bash"
INSTALLDIR="/usr/share/bsfl"

src_install() {
	insinto ${INSTALLDIR}
	doins bsfl
}
