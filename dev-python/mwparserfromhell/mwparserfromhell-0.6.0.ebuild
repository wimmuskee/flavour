# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{6..9} ) # pypy3 fails
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

version="${PV%'.0'}"

DESCRIPTION="A Python parser for MediaWiki wikicode"
HOMEPAGE="https://github.com/earwig/mwparserfromhell"
SRC_URI="https://github.com/earwig/${PN}/archive/v${version}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="mirror"

S="${WORKDIR}/${PN}-${version}"

python_test() {
	"${PYTHON}" setup.py -q test || die "Test failed with ${EPYTHON}"
}
