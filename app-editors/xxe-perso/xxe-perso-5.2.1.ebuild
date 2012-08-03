# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

name="${PN}-5_2_1"
DESCRIPTION="The XMLmind XML Editor (Personal Edition)"
HOMEPAGE="http://www.xmlmind.com/xmleditor"
SRC_URI="http://www.xmlmind.net/xmleditor/_download/${name}.tar.gz"
IUSE="doc examples"
SLOT="0"
LICENSE="xmlmind-xmleditor-perso"
KEYWORDS="amd64 x86"
RESTRICT="strip mirror"
RDEPEND=">=virtual/jre-1.6.0"
INSTALLDIR=/opt/${PN}
S="${WORKDIR}/${name}"

src_install() {
    insinto $INSTALLDIR

    # install addons
    doins -r addon

    # remove windows and mac stuff
    rm -rf bin/mac bin/*.bat bin/*.exe

    # install icons first, remove from bin
    doins -r bin/icon
    rm -rf bin/icon

    # install examples
    if use examples; then
        doins -r demo
    fi

    # finally, install prepared bin contents
    insinto "$INSTALLDIR/bin"
    doins bin/*.*

    exeinto  "$INSTALLDIR/bin"
    doexe bin/convertdoc bin/csscheck bin/deploywebstart bin/translatexxe bin/xmltool bin/xxe

    if use doc; then
        dohtml -r doc
    fi
}
