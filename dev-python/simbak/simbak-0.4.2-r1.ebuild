# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="A simple backup solution"
HOMEPAGE="https://github.com/mark-bromell/simbak"
SRC_URI="https://github.com/mark-bromell/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
RESTRICT="mirror"

DEPEND="test? (
	dev-python/freezegun[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
)"
RDEPEND="dev-python/python-dotenv[${PYTHON_USEDEP}]"

src_prepare() {
	eapply "${FILESDIR}/${PN}-${PV}-fileutil-test.patch"
	eapply_user
}

distutils_enable_tests pytest
