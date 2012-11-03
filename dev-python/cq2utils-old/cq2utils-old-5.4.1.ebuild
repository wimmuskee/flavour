# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="CQ2 Utils Old is a package with a wide range of valuable tools used for supporting the software based on python2.4 like Slowfoot and Meresco Harvester."
HOMEPAGE="http://sources.seecr.nl/sources"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
    || ( =dev-python/amara-1.1.7 =dev-python/amara-1.2 =dev-python/amara-1.2.0.2 )"