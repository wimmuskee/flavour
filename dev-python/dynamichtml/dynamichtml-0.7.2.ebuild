# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6:2.6 3:3.1:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A template engine based on generators, and a sequel to Slowfoot"
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://www.cq2.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"
DEPEND=""
RDEPEND="${DEPEND}"