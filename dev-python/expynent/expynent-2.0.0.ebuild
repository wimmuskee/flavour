# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{8..10} pypy3 )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="Library that provides regex patterns."
HOMEPAGE="https://github.com/lk-geimfari/expynent"
SRC_URI="https://github.com/lk-geimfari/expynent/archive/v2.0.0.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86"
RESTRICT="mirror"
PATCHES=(
	"${FILESDIR}/${P}-encoding.patch" )

distutils_enable_tests pytest
