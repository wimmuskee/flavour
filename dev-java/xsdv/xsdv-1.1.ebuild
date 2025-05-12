# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

JAVA_PKG_IUSE="source"

inherit java-pkg-2 git-r3

EGIT_REPO_URI="https://github.com/amouat/xsd-validator.git"
EGIT_COMMIT="9d6ba887e06f0beec53a452c06e0aa52b2fabea9"
DESCRIPTION="Commandline wrapper for Java XSD validation"
HOMEPAGE="https://github.com/amouat/xsd-validator"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6"

src_prepare() {
	default
	sed "s/@INSTALL_DIR@/\/usr\/share\/${PN}/" xsdv_install.sh > xsdv
}

src_test() {
	./xsdv.sh "${FILESDIR}/test.xsd" "${FILESDIR}/test.xml" || die
}

src_install() {
	default
	java-pkg_dojar "lib/xsdv.jar"
	dobin xsdv
	use source && java-pkg_dosrc src
}
