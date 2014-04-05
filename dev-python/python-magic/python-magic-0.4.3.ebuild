# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils

DESCRIPTION="A python wrapper for libmagic."
HOMEPAGE="http://github.com/ahupp/python-magic"
SRC_URI="https://github.com/ahupp/python-magic/archive/${PV}.tar.gz"
LICENSE="PSF"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="~amd64"