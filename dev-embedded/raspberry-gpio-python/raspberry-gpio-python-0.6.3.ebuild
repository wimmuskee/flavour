# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_{4,5}} )

inherit distutils-r1

DESCRIPTION="a Python module to control the GPIO on a Raspberry Pi"
HOMEPAGE="https://sourceforge.net/projects/raspberry-gpio-python"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/RPi.GPIO-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm"
RESTRICT="mirror"
IUSE=""
S="${WORKDIR}/RPi.GPIO-${PV}"
