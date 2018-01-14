# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_{4,5}} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/peter17/pijnu.git"
EGIT_COMMIT="25518c3d1ca10955af514b36132777f15027d42d"
DESCRIPTION="A PEG parser generator and processor, written in Python."
HOMEPAGE="https://github.com/peter17/pijnu"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE=""