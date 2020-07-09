# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Pure Java application to load test functional behavior and measure performance"
HOMEPAGE="https://jmeter.apache.org/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://apache.hippo.nl/jmeter/binaries/apache-jmeter-${PV}.tgz -> ${P}.tar.gz"
RESTRICT="bindist strip mirror"
RDEPEND=">=virtual/jre-1.8"
IUSE="doc examples"
INSTALLDIR="/opt/JMeter"
S="${WORKDIR}/apache-jmeter-${PV}"
DOCS="README.md LICENSE NOTICE licenses"

src_install() {
	insinto ${INSTALLDIR}
	doins -r bin lib

	if use doc; then
		HTML_DOCS="printable_docs"
	fi

	if ! use examples; then
		rm -r ${D}/${INSTALLDIR}/bin/examples
	fi

	# executables
	chmod 755 ${D}/${INSTALLDIR}/bin/*.sh
	chmod 755 ${D}/${INSTALLDIR}/bin/jmeter
	chmod 755 ${D}/${INSTALLDIR}/bin/mirror-server

	einstalldocs
}

pkg_postinst() {
	if [[ ! ${REPLACING_VERSIONS} ]]; then
		einfo "Application executable installed in ${INSTALLDIR}/bin/jmeter"
	fi
}
