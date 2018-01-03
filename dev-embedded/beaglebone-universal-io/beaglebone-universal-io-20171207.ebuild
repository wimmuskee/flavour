# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
inherit git-r3 linux-info

DESCRIPTION="Contains config-pin, an easy-to-use pin configuration script."
HOMEPAGE="https://github.com/RobertCNelson/bb.org-overlays/tree/master/tools/beaglebone-universal-io"
EGIT_REPO_URI="https://github.com/RobertCNelson/bb.org-overlays.git"
EGIT_COMMIT="0013331fd0fe49b90af5a57944ef854283ab1d70"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
RESTRICT="mirror"
IUSE=""
RDEPEND="app-shells/dash"
DOCS="tools/beaglebone-universal-io/README.md"

pkg_setup() {
	# get kernel version for use in postinst
	get_running_version
}

src_compile() {
	# do not compile anything in root
	return
}

src_install() {
	dosbin tools/beaglebone-universal-io/config-pin
	einstalldocs
}

pkg_postinst() {
	einfo "If using a 3.14 or newer kernel, make sure your device tree includes the"
	einfo "pinmux helper entries required for the pins you want to use."

	if kernel_is 3 8 13 ; then
		einfo "If using a 3.8.13 kernel with capemgr, load the overlay as usual:"
		einfo "  echo cape-universal > /sys/devices/bone_capemgr.*/slots"
	fi

	if kernel_is -ge 4 1 ; then
		einfo "From kernel 4.1 the slots file lives in a new home:"
		einfo "  echo cape-universal > /sys/devices/platform/bone_capemgr/slots"
	fi
}
