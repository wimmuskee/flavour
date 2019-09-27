# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="AUR build for forticlientsslvpn_cli"
HOMEPAGE="https://github.com/machtelik/forticlientsslvpn"
SRC_URI="https://github.com/machtelik/forticlientsslvpn/raw/master/tarball/forticlientsslvpn_linux_${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="FortiClientSSLVPN"
RESTRICT="bindist strip mirror"
DEPEND=""
RDEPEND="net-dialup/ppp"

INSTALLDIR="/opt/fortinet/forticlientsslvpn"
S="${WORKDIR}/forticlientsslvpn"

src_install() {
	if use amd64; then
		arch="64bit"
	fi

	if use x86; then
		arch="32bit"
	fi

	exeinto ${INSTALLDIR}
	doexe "${arch}/forticlientsslvpn_cli"

	# not sure which of these is required for cli
	insinto ${INSTALLDIR}
	doins -r "${arch}/helper"

	chmod 555 "${D}/${INSTALLDIR}/helper"
	chmod 755 "${D}/${INSTALLDIR}/helper/fctrt"
	chmod 755 "${D}/${INSTALLDIR}/helper/printcert"
	chmod 755 "${D}/${INSTALLDIR}/helper/setup"
	chmod 755 "${D}/${INSTALLDIR}/helper/showlicense"
	chmod 755 "${D}/${INSTALLDIR}/helper/subproc"
	chmod 755 "${D}/${INSTALLDIR}/helper/waitppp.sh"

	newbin "${FILESDIR}/forticlientsslvpn_cli.sh" forticlientsslvpn_cli
}
