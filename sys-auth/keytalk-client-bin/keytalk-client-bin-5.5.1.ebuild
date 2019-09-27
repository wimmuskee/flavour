# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# notes:
# ebuild is not installing apache2/tomcat renewal functions
# not using uninstaller

EAPI="7"

inherit systemd

DESCRIPTION="Retrieve command prompt based KeyTalk issued certificates."
HOMEPAGE="https://www.keytalk.com/"
SRC_URI="https://downloads.keytalk.com/downloads/clients/KeyTalkClient-${PV}-linux.tar"
SLOT="0"
KEYWORDS="~amd64"
LICENSE="KeyTalk"
RESTRICT="bindist mirror"
IUSE="systemd"
DEPEND=""
# need findutils and openssl in custom client script
RDEPEND="app-admin/killproc
	app-misc/ca-certificates
	<dev-libs/openssl-1.1
	dev-libs/nss
	sys-apps/hdparm
	sys-apps/findutils
	sys-fs/inotify-tools
	sys-process/psmisc
	systemd? ( sys-apps/systemd )"
S="${WORKDIR}/keytalkclient-${PV}"
PATCHES=(
	"${FILESDIR}/${P}-keytalk_ca_updater.patch"
	"${FILESDIR}/${P}-systemd-service.patch"
)

src_unpack() {
	default
	# debian9 version uses openssl-1.1
	tar -xzf KeyTalkClient-${PV}-debian8-x64.tgz
}

src_install() {
	# the original installer did this
	insinto /etc
	uuidgen | tr -d '-' > .keytalk_uuid
	doins .keytalk_uuid

	dobin ktclient
	dobin ktconfig
	dobin ktconfupdater
	dobin ktconfigtool
	dobin ktprgen
	dobin hwutils
	dobin keytalk_ca_updater.sh
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

	# service files
	newinitd "${FILESDIR}/etc_init.d_keytalk-ca-updater" keytalk-ca-updater
	if use systemd; then
		systemd_newunit etc_systemd_system_keytalk-ca-updater.service keytalk-ca-updater.service
	fi
}

pkg_postinst() {
	einfo "Running ktconfupdater --set-install-dir on /usr/bin"
	ktconfupdater --set-install-dir /usr/bin

	einfo
	einfo "Use the keytalk-ca-updater init.d script to keep the System Certificate Trust updated."

	einfo
	einfo "Run the keytalk-client command as a user to setup initially"
	einfo "and get or refresh a certificate."
}
