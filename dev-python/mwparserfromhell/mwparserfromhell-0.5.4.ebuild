# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python{2_7,3_{5,6}} )

inherit distutils-r1

DESCRIPTION="A Python parser for MediaWiki wikicode."
HOMEPAGE="https://github.com/earwig/mwparserfromhell"
SRC_URI="https://github.com/earwig/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

python_test() {
	"${PYTHON}" setup.py -q test || die "Test failed with ${EPYTHON}"
}
