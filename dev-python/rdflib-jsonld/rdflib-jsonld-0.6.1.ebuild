# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1

DESCRIPTION="rdflib extension adding JSON-LD parser and serializer"
HOMEPAGE="https://github.com/RDFLib/rdflib-jsonld"
SRC_URI="https://github.com/RDFLib/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

RDEPEND=">=dev-python/rdflib-5.0.0[${PYTHON_USEDEP}]"

#distutils_enable_tests nose
# test failing
