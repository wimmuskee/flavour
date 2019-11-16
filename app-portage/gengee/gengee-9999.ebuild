# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1 git-r3

DESCRIPTION="Gentoo Github PR analysis tool"
HOMEPAGE="https://github.com/wimmuskee/gengee"
EGIT_REPO_URI="https://github.com/wimmuskee/gengee.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/PyGithub[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	sys-apps/portage[${PYTHON_USEDEP}]"
