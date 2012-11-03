# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A template engine based on generators, and a sequel to Slowfoot"
HOMEPAGE="http://sources.seecr.nl/sources"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
	=dev-python/amara-1.2.0.2
	dev-python/lxml
	>=dev-util/meresco-core-4.0
	<dev-util/meresco-core-4.0"