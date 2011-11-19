# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="CallstackScope retrieves variables from stackframes."
HOMEPAGE="http://www.meresco.org"
SRC_URI="http://sources.meresco.org/opensourcepackages/callstackscope-${PV}-src.tar.gz"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/callstackscope-${PV}"
