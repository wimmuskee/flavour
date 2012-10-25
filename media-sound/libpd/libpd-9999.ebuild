# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
EGIT_REPO_URI="git://github.com/libpd/libpd.git"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

inherit distutils eutils git-2

DESCRIPTION="Turning Pure Data into an embeddable audio synthesis library."
HOMEPAGE="http://www/libpd.cc"
IUSE=""
SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="python"
DEPEND="
	python? (
		dev-lang/swig
	)"
RDEPEND="${DEPEND}"


src_prepare() {
	epatch "${FILESDIR}/${PN}-makeinstall.patch"
}

src_compile() {
	emake libpd || die "emake compile failed"

	if use python; then
		pushd python
		distutils_src_compile
		popd
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dosym pd/libpd.so /usr/lib/libpd.so

	# headers
	insinto /usr/include/pd
	doins pure-data/src/*.h
	doins libpd_wrapper/*.h

	if use python; then
		pushd python
		distutils_src_install
		popd
	fi
}

pkg_postinst() {
	if use python; then
		distutils_pkg_postinst
	fi
}

pkg_postrm() {
	if use python; then
		distutils_pkg_postrm
	fi
}
