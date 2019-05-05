# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python2_7 )

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

python_test() {
	# only doing single test to test python compatibility
	# need seecr test deps for lots of the other tests
	"${PYTHON}" test/cqlparsertest.py || die "Test failed with ${EPYTHON}"
}
