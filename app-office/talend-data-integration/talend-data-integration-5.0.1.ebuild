# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="A powerful and versatile open source solution for data integration."
HOMEPAGE="http://www.talend.com"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
name="TOS_DI-r74687-V${PV}"
SRC_URI="http://sourceforge.net/projects/talend-studio/files/Talend%20Open%20Studio/${PV}/${name}.zip"
IUSE="doc"
RESTRICT="strip mirror"
RDEPEND=">=virtual/jre-1.5"

INSTALLDIR="/opt/Talend/DataIntegration5"
QA_PREBUILT="opt/Talend/DataIntegration5/plugins/* opt/Talend/DataIntegration5/features/*"
S="${WORKDIR}/${name}"

src_install() {
	# application
	insinto ${INSTALLDIR}
	doins -r configuration features plugins workspace

	# docs
	if use doc; then
		dodoc about_files/*
	fi

	# executables
	if use x86; then
		doins cp TOS_DI-linux-gtk-x86*
		chmod 755 ${INSTALLDIR}/TOS_DI-linux-gtk-x86
	elif use amd64; then
		doins TOS_DI-linux-gtk-x86_64*
		chmod 755 ${INSTALLDIR}/TOS_DI-linux-gtk-x86_64
	elif use ppc; then
		doins TOS_DI-linux-gtk-ppc*
		chmod 755 ${INSTALLDIR}/TOS_DI-linux-gtk-ppc
	fi
}
