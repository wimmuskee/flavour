# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_2} )

inherit distutils-r1

DESCRIPTION="A parser that builds a parsetree for the given CQL and can convert this into other formats."
HOMEPAGE="https://github.com/seecr/cqlparser"
SRC_URI="https://github.com/seecr/cqlparser/archive/${PV}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/cqlparser-${PV}"
