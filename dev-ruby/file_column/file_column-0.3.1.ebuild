# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="This library makes handling of uploaded files in Ruby on Rails as easy as it should be."
HOMEPAGE="http://www.kanthak.net/opensource/file_column/"
SRC_URI="http://www.kanthak.net/opensource/file_column/file-column-0.3.1.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"
RESTRICT="mirror"
USE_RUBY="ruby18"

DEPEND="virtual/ruby"

RDEPEND="${DEPEND}
    dev-ruby/rails"

SITERUBY=$(${RUBY} -r rbconfig -e 'print Config::CONFIG["sitedir"]')
INSTALLDIR="${SITERUBY}/1.8/${PN}/"
S="${WORKDIR}/file-column-${PV}"

src_unpack() {
    ruby_src_unpack
}

src_test() {
    true
}

src_install() {
    dodir ${INSTALLDIR}
    cp -r lib test "${D}${INSTALLDIR}" || die "Installing failed."
    dodoc CHANGELOG README TODO || die "Installing documentation failed."

    # installing loader
    insinto ${SITERUBY}
    doins ${FILESDIR}/file_column.rb
    
    if use doc; then
	dohtml -r doc/* || die "Installing html documentation failed."
    fi
}
