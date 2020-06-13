# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

SRC_URI="https://github.com/jongracecox/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="A Python project for generating badges for your projects"
HOMEPAGE="https://github.com/jongracecox/anybadge"
LICENSE="MIT"
SLOT="0"
RESTRICT="mirror"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
BDEPEND="dev-python/wheel[${PYTHON_USEDEP}]"
RDEPEND="dev-python/pygments[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
