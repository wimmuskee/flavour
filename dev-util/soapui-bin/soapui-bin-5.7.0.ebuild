# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="SoapUI is a free and open source cross-platform Functional Testing solution."
HOMEPAGE="https://www.soapui.org/"
LICENSE="SmartBear"
SLOT="0"
KEYWORDS="~amd64 ~x86"
SRC_URI="https://s3.amazonaws.com/downloads.eviware/soapuios/${PV}/SoapUI-${PV}-linux-bin.tar.gz"
RESTRICT="bindist strip mirror"
RDEPEND=">=virtual/jre-11"
IUSE="examples"
INSTALLDIR="/opt/SoapUI"
S="${WORKDIR}/SoapUI-${PV}"
DOCS="README.md RELEASENOTES.txt LICENSE.md LICENSE.txt"

src_install() {
	# application
	insinto ${INSTALLDIR}
	doins -r bin lib wsi-test-tools soapui-settings.xml

	if use examples; then
		doins -r Tutorials
	fi

	# executables
	chmod 755 ${D}/${INSTALLDIR}/bin/*.sh

	einstalldocs
}

pkg_postinst() {
	if [[ ! ${REPLACING_VERSIONS} ]]; then
		einfo "Application executable installed in ${INSTALLDIR}/bin/soapui.sh"
	fi
}
