# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{10..13} pypy3 )

inherit distutils-r1

DESCRIPTION="Library that provides regex patterns."
HOMEPAGE="https://github.com/lk-geimfari/expynent"
SRC_URI="https://github.com/lk-geimfari/expynent/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86"
RESTRICT="mirror"
PATCHES=(
	"${FILESDIR}/${P}-encoding.patch" )

distutils_enable_tests pytest
