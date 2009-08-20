# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A parser that builds a parsetree for the given CQL and can convert this into other formats."
HOMEPAGE="http://www.cq2.nl/sources"
SRC_URI="http://www.cq2.nl/opensourcepackages/cqlparser-${PV}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
	
S="${WORKDIR}/cqlparser-${PV}"

DOCS="INSTALL"
