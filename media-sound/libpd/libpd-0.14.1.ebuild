# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )
inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/libpd/libpd.git"
EGIT_COMMIT="0.14.1"
EGIT_SUBMODULES=( "jni/opensl_stream" "pure-data" )

DESCRIPTION="Turning Pure Data into an embeddable audio synthesis library."
HOMEPAGE="https://github.com/libpd/libpd"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
		distutils-r1_src_install
		popd
	fi

	# examples
	if use examples && use python; then
		insinto "/usr/share/${PN}/examples/python"
		doins samples/python/*
	fi

	einstalldocs
}
