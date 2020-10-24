# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{7..8} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/libpd/libpd.git"
EGIT_SUBMODULES=( "jni/opensl_stream" "pure-data" )
EGIT_OVERRIDE_REPO_NETTOYEURNY_OPENSL_STREAM="https://github.com/nettoyeurny/opensl_stream.git"
EGIT_OVERRIDE_REPO_PURE_DATA_PURE_DATA="https://github.com/pure-data/pure-data.git"

DESCRIPTION="Turning Pure Data into an embeddable audio synthesis library."
HOMEPAGE="http://www.libpd.cc"
SLOT="0"
LICENSE="BSD"
KEYWORDS=""
IUSE="examples python"
DEPEND="python? (
		dev-lang/swig
	)"
RDEPEND="python? (
		dev-python/pyaudio[${PYTHON_USEDEP}]
	)"

src_compile() {
	emake libpd || die "emake compile libpd failed"

	if use python; then
		pushd python
		distutils-r1_src_compile || die "distutils compile python failed"
		popd
	fi
}

src_install() {
	emake prefix="${D}/usr" libdir="${D}/usr/$(get_libdir)" install || die "emake install failed"

	if use python; then
		pushd python
		distutils-r1_src_install || die "distutils install python failed"
		popd
	fi

	# examples
	if use examples && use python; then
		insinto "/usr/share/${PN}/examples/python"
		doins samples/python/*
	fi

	einstalldocs
}
