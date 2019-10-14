# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python{2_7,3_{5,6,7}} pypy3 )

inherit distutils-r1

DESCRIPTION="Library that provides regex patterns."
HOMEPAGE="https://github.com/lk-geimfari/expynent"
SRC_URI="https://github.com/lk-geimfari/expynent/archive/v2.0.0.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
PATCHES=(
	"${FILESDIR}/${P}-encoding.patch" )
