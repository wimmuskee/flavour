# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{7,8} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="Scheduler for sensor driven interactions"
HOMEPAGE="https://github.com/wimmuskee/argoid"
SRC_URI="https://github.com/wimmuskee/argoid/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
RESTRICT="mirror"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND=">=dev-lang/python-exec-2[${PYTHON_USEDEP}]
	dev-embedded/adafruit-beaglebone-io-python[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]"
S="${WORKDIR}/argoid-${PV}"

python_install() {
	# When cross-compiling, package installs in lib64
	# where python-exec cannot find it.
	# There is probably a better way, but for now only installing
	# on arm, and always install in /usr/lib
	python_sitedir=$(python_get_sitedir | sed 's/lib64/lib/')
	distutils-r1_python_install --install-lib="${python_sitedir}"

	# init.d
	newinitd client/openrc-run.initd argoid-client
}
