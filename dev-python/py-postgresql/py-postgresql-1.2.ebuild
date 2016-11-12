# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/python-postgres/fe.git"
EGIT_COMMIT="8c770ae36d47039fd251dfe90f4b2ff71bd28964"
DESCRIPTION="Access a PostgreSQL database with Python 3."
HOMEPAGE="http://python.projects.postgresql.org/"
RESTRICT="mirror"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
