# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Converts CSV files to IMS VDEX XML."
HOMEPAGE="http://pypi.python.org/pypi/vdexcsv"
SRC_URI="https://github.com/bluedynamics/${PN}/archive/${PV}.zip"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}
	dev-python/lxml"
