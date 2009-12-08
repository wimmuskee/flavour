# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# depend on meresco-core


EAPI="2"

inherit distutils

DESCRIPTION="Components to build searchengines, repositories and archives, based on Meresco Core."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://www.cq2.nl/opensourcepackages/${P}-src.tar.gz"
SLOT="0"
LICENSE="GPL2"
KEYWORDS="~amd64"

IUSE="doc examples"

DEPEND=">=dev-libs/glib-2.0
    dev-java/gcj-jdk"

RDEPEND="${DEPEND}
    =dev-python/python-cqlparser-1.5*
    =dev-python/python-storage-5.1*
    =dev-python/cq2utils-5.4*
    =dev-python/weightless-0.4*
    =dev-python/amara-1.2.0.2
    >=dev-python/lxml-1.2
    !>=dev-python/lxml-2.0
    sys-apps/file[python]
    dev-python/python-levenshtein
    =dev-python/python-callstackscope-0.1*"


src_install() {
    distutils_src_install

    # copy docs
    if use doc; then
        dodoc doc/*.odt doc/MerescoComponentLibrary.txt || die "Installing docs failed."
    fi

    # copy examples
    if use examples; then
        docinto examples
        dodoc examples/ExampleApplicationDna.txt || die "Installing examples failed."
    fi
}
