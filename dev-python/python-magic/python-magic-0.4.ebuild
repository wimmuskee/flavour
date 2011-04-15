# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils git

EGIT_REPO_URI="http://github.com/ahupp/python-magic.git"
EGIT_COMMIT="9e5ab19c49c7669d362b"

DESCRIPTION="A python wrapper for libmagic."
HOMEPAGE="http://github.com/ahupp/python-magic"
LICENSE="PSF"
SLOT="0"
KEYWORDS="~amd64"