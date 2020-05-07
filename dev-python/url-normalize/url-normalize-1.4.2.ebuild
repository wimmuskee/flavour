# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{6,7,8} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

DESCRIPTION="URL normalization for Python"
HOMEPAGE="https://github.com/niksite/url-normalize"
SRC_URI="https://github.com/niksite/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RESTRICT="mirror"
DEPEND="dev-python/six[${PYTHON_USEDEP}]"
RDEPEND="dev-python/six[${PYTHON_USEDEP}]"

src_prepare() {
	default
	cp "${FILESDIR}/setup.py" setup.py
	rm tox.ini
}

distutils_enable_tests pytest
