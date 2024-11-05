# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Text tokenization and sentence segmentation."
HOMEPAGE="https://github.com/fnl/syntok"
SRC_URI="https://github.com/fnl/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
RESTRICT="mirror"
RDEPEND="dev-python/regex[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
