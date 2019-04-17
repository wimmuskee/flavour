# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# note: ebuild is not installing apache2 renewal functions

EAPI="6"

DESCRIPTION="Retrieve command prompt based KeyTalk issued certificates."
HOMEPAGE="https://www.keytalk.com/"
SRC_URI="https://downloads.keytalk.com/downloads/KTlinuxapacheclient.${PV}.zip"
SLOT="0"
KEYWORDS="~amd64"
LICENSE="KeyTalk"
RESTRICT="mirror"
DEPEND="app-arch/unzip"
# need findutils and openssl in custom client script
RDEPEND="app-misc/ca-certificates
	<dev-libs/openssl-1.1
	sys-apps/hdparm
	sys-apps/findutils
	sys-process/psmisc"
S="${WORKDIR}/keytalkclient-${PV}"

src_unpack() {
	default
	tar -xzf KeyTalkClient-${PV}-debian8_ubuntu16.04-x64.tgz
}

src_install() {
	dobin ktclient
	dobin ktconfig
	dobin ktconfupdater
	dobin ktconfigtool
	dobin ktprgen
	dobin hwutils
	dobin "${FILESDIR}/keytalk-client"

	fperms 4755 /usr/bin/ktconfig
	fperms 4755 /usr/bin/hwutils

	dolib.so libtalogger.so

	insinto /etc/keytalk
	doins resept.ini
	doins version
	doins devstage
	doins cr.conf

	insinto /usr/share/keytalk
	doins "${FILESDIR}/empty-user.ini"
}

pkg_postinst() {
	# needed after install command
	ktconfupdater --set-install-dir /usr/bin

	einfo "Run the keytalk-client command as a user to"
	einfo "setup initially and get or refresh a certificate."
}
