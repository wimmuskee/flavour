# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A parser that builds a parsetree for the given CQL and can convert this into other formats."
HOMEPAGE="http://sources.meresco.org/sources"
SRC_URI="http://sources.meresco.org/opensourcepackages/cqlparser-${PV}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}"
	
S="${WORKDIR}/cqlparser-${PV}"
