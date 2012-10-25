# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils eutils git-2

EGIT_REPO_URI="git://github.com/libpd/libpd.git"
PYTHON_DEPEND="*:2.6:3.1"
SUPPORT_PYTHON_ABIS="1"

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


src_prepare() {
	# i realize this patch doesn't win any beauty contests
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

	if use python; then
		pushd python
		distutils_src_install
		popd
	fi
}
