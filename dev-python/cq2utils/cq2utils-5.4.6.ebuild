# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A package with a wide range of valuable tools for MERESCO and other cq2 packages."
HOMEPAGE="http://www.cq2.nl/sources"
SRC_URI="http://www.cq2.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
    || ( =dev-python/amara-1.1.7 =dev-python/amara-1.2 =dev-python/amara-1.2.0.2 )    
    >=dev-python/lxml-1.2
    >=dev-python/pyinotify-0.7.1
    <dev-python/pyinotify-0.8"
