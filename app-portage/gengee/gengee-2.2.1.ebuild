# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Gentoo Github PR analysis tool"
HOMEPAGE="https://github.com/wimmuskee/gengee"
SRC_URI="https://github.com/wimmuskee/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
RDEPEND="dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/PyGithub[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	sys-apps/portage[${PYTHON_USEDEP}]
"
