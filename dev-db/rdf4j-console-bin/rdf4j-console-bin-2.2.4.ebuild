# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# this ebuild is not following the Gentoo way for installing Java packages
# need some kind of packaging, and don't have the time to dive into it
# furthermore, not all console functions are tested with current dependencies
# just; connecting, looking at repo's and loading new data

EAPI="6"

inherit java-utils-2

maven_rdf4j_uri="http://central.maven.org/maven2/org/eclipse/rdf4j"

SRC_URI="${maven_rdf4j_uri}/rdf4j-console/${PV}/rdf4j-console-${PV}.jar
	${maven_rdf4j_uri}/rdf4j-http-client/${PV}/rdf4j-http-client-${PV}.jar
	${maven_rdf4j_uri}/rdf4j-repository-api/${PV}/rdf4j-repository-api-${PV}.jar
	${maven_rdf4j_uri}/rdf4j-repository-manager/${PV}/rdf4j-repository-manager-${PV}.jar
	${maven_rdf4j_uri}/rdf4j-repository-sail/${PV}/rdf4j-repository-sail-${PV}.jar
	${maven_rdf4j_uri}/rdf4j-runtime-osgi/${PV}/rdf4j-runtime-osgi-${PV}.jar"

DESCRIPTION="RDF4J console application."
HOMEPAGE="http://rdf4j.org/"
LICENSE="EPL-1.0"
SLOT="0"
RESTRICT="mirror"
KEYWORDS=""
IUSE=""
DEPEND=">=virtual/jre-1.8:=
	dev-java/commons-codec:0
	dev-java/commons-cli:1
	dev-java/commons-logging:0
	dev-java/guava:20
	dev-java/logback:0
	dev-java/slf4j-api:0
	dev-java/httpcomponents-core:4.4
	dev-java/httpcomponents-client:4.5"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
	for f in ${A}; do
		cp "${DISTDIR}/${f}" "${S}"
	done
}

src_install() {
	java-pkg_jarinto /opt/${P}/lib/

	for f in ${A}; do
		new=$(echo ${f} | sed 's|-'"${PV}"'||')
		java-pkg_newjar "${S}/${f}" ${new}
	done

	java-pkg_addcp $(java-pkg_getjars commons-codec,commons-cli-1,commons-logging,guava-20,logback,slf4j-api,httpcomponents-core-4.4,httpcomponents-client:4.5)
	java-pkg_dolauncher ${PN} --main org.eclipse.rdf4j.console.Console
}
