# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{6,7,8} )
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

DESCRIPTION="a Python module to control the GPIO on a Raspberry Pi"
HOMEPAGE="https://sourceforge.net/projects/raspberry-gpio-python"
SRC_URI="https://downloads.sourceforge.net/project/${PN}/RPi.GPIO-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
RESTRICT="mirror"
IUSE=""
S="${WORKDIR}/RPi.GPIO-${PV}"
