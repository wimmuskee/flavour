# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.7"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit bzr distutils eutils twisted

EBZR_REPO_URI="http://bazaar.launchpad.net/~epoptes/epoptes/trunk"
DESCRIPTION="Computer lab administration and monitoring tool"
HOMEPAGE="http://www.epoptes.org/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="dev-python/twisted
	dev-python/notify-python
	dev-python/python-distutils-extra"

RDEPEND="${DEPEND}
	dev-libs/openssl
	dev-python/dbus-python
	dev-python/pygtk
	gnome-base/librsvg
	gnome-extra/zenity[libnotify]
	net-zope/zope-interface
	sys-apps/iproute2
	x11-libs/vte[introspection]"

pkg_setup() {
	enewgroup epoptes
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-noclient_setup.patch"
}

src_compile() {
	# not the best solution, but
	# a separate build && build install won't work
	echo "do nothing" > /dev/null
}

src_install() {
	distutils_src_install

	insinto /etc/default
	newins debian/epoptes.default epoptes

	newinitd ${FILESDIR}/epoptes.initd epoptes
}
