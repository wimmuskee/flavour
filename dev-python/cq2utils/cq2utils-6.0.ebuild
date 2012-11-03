# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A package with a wide range of valuable tools for MERESCO and other cq2 packages."
HOMEPAGE="http://sources.seecr.nl/sources"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
    =dev-python/amara-1.2.0.2   
    >=dev-python/lxml-1.2
    >=dev-python/pyinotify-0.7.1
    <dev-python/pyinotify-0.9"
