# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

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
RDEPEND="app-misc/ca-certificates
	<dev-libs/openssl-1.1
	sys-apps/hdparm
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

	fperms 4755 /usr/bin/ktconfig
	fperms 4755 /usr/bin/hwutils

	dolib.so libtalogger.so

	insinto /etc/keytalk
	doins resept.ini
	doins version
	doins devstage
	doins cr.conf

	insinto /usr/share/keytalk
	doins ${FILESDIR}/empty-user.ini
}

pkg_postinst() {
	if [[ ! ${REPLACING_VERSIONS} ]]; then
		einfo "Before letting your users call ktclient, run:"
		einfo "    emerge --config =${CATEGORY}/${PF}"
	fi
}

pkg_config() {
	# needed after install command
	ktconfupdater --set-install-dir /usr/bin

	# setting a user owned .keytalk dir with
	# empty user.ini (instead of root owned)
	users=$(grep users /etc/group | cut -d ":" -f 4)
	echo ${users} | sed -n 1'p' | tr ',' '\n' | while read user; do
		einfo "Setting up ${user}"
		homedir=$(eval echo "~${user}")
		mkdir -p ${homedir}/.keytalk
		cp /usr/share/keytalk-client/empty-user.ini ${homedir}/.keytalk/user.ini
		chown -R ${user}:users ${homedir}/.keytalk
	done
	einfo ""
	einfo "Each user can now issue the following:"
	einfo "    ktconfig --rccd-path <rccd-url>"
	einfo ""
	einfo "And run the following to get or refresh a certificate:"
	einfo "    ktclient --user <user> --interactive --save-pfx"
}
