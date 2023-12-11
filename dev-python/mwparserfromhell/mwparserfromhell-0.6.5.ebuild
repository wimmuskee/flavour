# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} ) # pypy3 fails

inherit distutils-r1

# remove patch part from gentoo version
# upstream releases 0.6.0 as 0.6
version="${PV%'.0'}"

DESCRIPTION="A Python parser for MediaWiki wikicode"
HOMEPAGE="https://github.com/earwig/mwparserfromhell"
SRC_URI="https://github.com/earwig/${PN}/archive/v${version}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="mirror"

S="${WORKDIR}/${PN}-${version}"

distutils_enable_tests pytest
