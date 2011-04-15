# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Storage stores data in a reliable, extendable filebased storage with great performance."
HOMEPAGE="http://www.cq2.nl/sources"
SRC_URI="http://www.cq2.nl/opensourcepackages/storage-${PV}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
    dev-vcs/rcs"
	
S="${WORKDIR}/storage-${PV}"
