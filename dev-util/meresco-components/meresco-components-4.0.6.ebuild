# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Components to build searchengines, repositories and archives, based on Meresco Core."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
	=dev-python/amara-1.2.0.2
	>=dev-python/python-cqlparser-1.7
	>=dev-python/escaping-0.1
	>=dev-python/cq2utils-6.0
	dev-python/python-levenshtein
	>=dev-python/lxml-2.1
	dev-python/python-magic
	>=dev-util/meresco-core-4.0.1
	>=dev-util/meresco-xml-4.0
	>=dev-python/python-storage-6.0.2
	>=dev-python/weightless-core-0.7
	sys-process/lsof"
