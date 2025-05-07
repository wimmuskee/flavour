# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="Parsing made fun ... using typing."
HOMEPAGE="https://github.com/hgrecco/flexparser"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN}" "${PV:0:3}")"
S="${WORKDIR}/${PN}-${PV:0:3}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
RDEPEND="dev-python/typing-extensions[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
