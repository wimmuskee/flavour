# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="A parser that builds a CQL parsetree and can convert this into other formats."
HOMEPAGE="https://github.com/seecr/cqlparser"
SRC_URI="https://github.com/seecr/cqlparser/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/cqlparser-${PV}"
