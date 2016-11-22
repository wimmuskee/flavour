# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_2,3_4,3_5} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/libpd/libpd.git"
EGIT_COMMIT="019f864802cebc531f425ba6d1be8fd49f630a3e"
EGIT_SUBMODULES=( "jni/opensl_stream" "pure-data" )
DESCRIPTION="Turning Pure Data into an embeddable audio synthesis library."
HOMEPAGE="http://www/libpd.cc"
SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples python"
DEPEND="python? (
		dev-lang/swig
	)"
RDEPEND="python? (
		dev-python/pyaudio
	)"
PATCHES=(
	"${FILESDIR}/${P}-makefile_destdir.patch"
	"${FILESDIR}/${P}-makefile_mkdir_lib.patch" )

src_compile() {
	emake libpd || die "emake compile libpd failed"
	emake cpplib || die "emake compile cpplib failed"

	if use python; then
		pushd python
		distutils-r1_src_compile || die "distutils compile python failed"
		popd
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	if use python; then
		pushd python
		distutils-r1_src_install || die "distutils install python failed"
		popd
	fi

	# examples
	if use examples; then
		if use python; then
			insinto "/usr/share/${PN}/examples/python"
			doins samples/python/*
		fi
	fi

	# docs
	dodoc CHANGES.txt
	dodoc LICENSE.txt
	dodoc README.md
}
