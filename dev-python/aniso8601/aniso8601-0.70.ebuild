# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A library for parsing ISO 8601 strings."
HOMEPAGE="https://bitbucket.org/nielsenb/aniso8601"
SRC_URI="https://pypi.python.org/packages/source/a/aniso8601/${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

