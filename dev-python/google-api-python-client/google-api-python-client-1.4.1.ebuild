# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Google APIs Client Library for Python."
HOMEPAGE="https://developers.google.com/api-client-library/python/"
SRC_URI="https://pypi.python.org/packages/source/g/${PN}/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""
DEPEND=""
RDEPEND="dev-python/httplib2
   dev-python/python-gflags"
