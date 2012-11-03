# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Storage stores data in a reliable, extendable filebased storage with great performance."
HOMEPAGE="http://sources.seecr.nl/sources"
SRC_URI="http://sources.seecr.nl/opensourcepackages/storage-${PV}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/escaping-0.1"
	
S="${WORKDIR}/storage-${PV}"
