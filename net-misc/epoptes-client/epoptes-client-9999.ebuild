# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit bzr

EBZR_REPO_URI="http://bazaar.launchpad.net/~epoptes/epoptes/trunk"
DESCRIPTION="Client daemon for Epoptes"
HOMEPAGE="http://www.epoptes.org/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/openssl
	dev-python/pygtk"


src_install() {
	# first install the files not in share
	dosbin epoptes-client/epoptes-client

	insinto /usr/share/ldm/rc.d
	doins epoptes-client/X50-client-env
	
	insinto /etc/xdg/autostart
	doins epoptes-client/epoptes-client.desktop

	insinto /usr/share/epoptes-client
	doins epoptes-client/lock.svg
	doins epoptes-client/remote_assistance.ui

	# remove
	rm epoptes-client/epoptes-client
	rm epoptes-client/X50-client-env
	rm epoptes-client/epoptes-client.desktop
	rm epoptes-client/lock.svg
	rm epoptes-client/remote_assistance.ui

	# install the rest
	insopts -m755
	doins epoptes-client/*

	# man and config
	doman epoptes-client.8

	insinto /etc/default
	newins debian/epoptes-client.default epoptes-client
}