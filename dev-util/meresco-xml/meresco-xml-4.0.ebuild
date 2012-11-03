# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="XML components based on Meresco."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/lxml-2.1
	>=dev-util/meresco-core-4.0"
