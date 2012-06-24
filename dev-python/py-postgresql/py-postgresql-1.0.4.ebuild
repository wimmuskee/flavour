# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="3:3.1"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.*"

inherit distutils

DESCRIPTION="A project dedicated to improving the Python interfaces to PostgreSQL."
HOMEPAGE="http://python.projects.postgresql.org/"
SRC_URI="http://python.projects.postgresql.org/files/${P}.tar.xz"
RESTRICT="mirror"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""