# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Google APIs Client Library for Python."
HOMEPAGE="https://developers.google.com/api-client-library/python/"
SRC_URI="http://google-api-python-client.googlecode.com/files/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
IUSE=""
DEPEND=""
RDEPEND="dev-python/httplib2
   dev-python/python-gflags"
