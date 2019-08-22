# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{2_7,3_{5,6}} )

inherit distutils-r1 eutils

DESCRIPTION="Python bindings for the EVE API."
HOMEPAGE="https://github.com/eve-val/evelink"
SRC_URI="https://github.com/eve-val/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/requests-1.1.0[${PYTHON_USEDEP}]"
PATCHES=( "${FILESDIR}/${P}-setup.patch" )

# not including test functionality
# for this, the following are required:
# mock, nose, unittest2
