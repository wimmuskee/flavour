# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Python traceback tools"
HOMEPAGE="http://www.cq2.nl/sources"
SRC_URI="http://www.cq2.nl/opensourcepackages/callstackscope-${PV}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
	
S="${WORKDIR}/callstackscope-${PV}"

#DOCS="INSTALL"
