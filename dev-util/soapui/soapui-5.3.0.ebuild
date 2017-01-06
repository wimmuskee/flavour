# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

DESCRIPTION="SoapUI is a free and open source cross-platform Functional Testing solution."
HOMEPAGE="http://www.soapui.org/"
LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://cdn01.downloads.smartbear.com/${PN}/${PV}/SoapUI-${PV}-linux-bin.tar.gz"
RESTRICT="${RESTRICT} strip mirror"
RDEPEND=">=virtual/jre-1.6"

INSTALLDIR="/opt/SoapUI"
S="${WORKDIR}/SoapUI-${PV}"
DOCS="README.md LICENSE.txt RELEASENOTES.txt"

src_install() {
	# application
	insinto ${INSTALLDIR}
	doins -r Tutorials bin lib wsi-test-tools soapui-settings.xml

	# executables
	chmod 755 ${D}/${INSTALLDIR}/bin/*.sh

	einstalldocs
}

pkg_postinst() {
	if [[ ! ${REPLACING_VERSIONS} ]]; then
		einfo "Application executable installed in ${INSTALLDIR}/bin/soapui.sh"
	fi
}
