# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit distutils-r1

DESCRIPTION="Scheduler for sensor driven interactions"
HOMEPAGE="https://github.com/wimmuskee/argoid"
SRC_URI="https://github.com/wimmuskee/argoid/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
RESTRICT="mirror"
IUSE=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-lang/python-exec-2"
S="${WORKDIR}/argoid-${PV}"

python_install() {
	# When cross-compiling, package installs in lib64
	# where python-exec cannot find it.
	# There is probably a better way, but for now only installing
	# on arm, and always install in /usr/lib
	python_sitedir=$(python_get_sitedir | sed 's/lib64/lib/')
	distutils-r1_python_install --install-lib="${python_sitedir}"
}
