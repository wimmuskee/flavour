# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=bdepend

inherit distutils-r1

DESCRIPTION="Adafruit's BeagleBone IO Python Library"
HOMEPAGE="https://github.com/adafruit/adafruit-beaglebone-io-python"
SRC_URI="https://github.com/adafruit/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
RESTRICT="mirror"
IUSE=""
