# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_{4,5}} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="git://github.com/lk-geimfari/expynent.git"
DESCRIPTION="Library that provides regex patterns."
HOMEPAGE="https://github.com/lk-geimfari/expynent"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
IUSE=""
