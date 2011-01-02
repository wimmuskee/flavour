# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="Crawler and content extractor for building a full text index of a website's contents."
HOMEPAGE="http://rdig.rubyforge.org/"
SRC_URI="http://rubyforge.org/frs/download.php/33001/rdig-0.3.5.tgz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="pdf rtf doc examples"
RESTRICT="mirror test"
USE_RUBY="ruby18"

DEPEND="virtual/ruby
    doc? ( dev-ruby/rake )"

RDEPEND="${DEPEND}
    >=dev-ruby/hpricot-0.4 
    >=dev-ruby/ruby-ferret-0.10
    pdf? ( app-text/poppler )
    rtf? ( app-text/wv )"

PATCHES=("${FILESDIR}/bin-rdig.patch"
    "${FILESDIR}/lib-url_filters.patch"
    "${FILESDIR}/lib-hpricot.patch")
INSTALLDIR="/usr/lib/ruby/site_ruby/1.8/${PN}/"

src_unpack() {
    ruby_src_unpack
    # pathing to install the bin with the ebuild
}

src_compile() {
    # no econf, because --prefix ${D} won't work on install.rb
    
    if use doc; then
	rake rdoc || die "rake rdoc failed"
    fi
}

src_test() {
    #rake test_all fails by default
    true
}

src_install() {
    dodir ${INSTALLDIR}
    cp -r lib test bin "${D}${INSTALLDIR}" || die "Installing failed."
    dodoc CHANGES  LICENSE  README || die "Installing documentation failed."
    
    # installing binary
    fperms 755 "${INSTALLDIR}bin/rdig"
    dosym "${INSTALLDIR}bin/rdig" /usr/bin/rdig || die "Creating bin symlink failed."

    # installing loader
    SITERUBY=$(${RUBY} -r rbconfig -e 'print Config::CONFIG["sitedir"]')
    insinto ${SITERUBY}
    doins ${FILESDIR}/rdig.rb
    
    # copying docs also to keep rakefile task integrity
    cp rakefile CHANGES LICENSE README TODO ${D}${INSTALLDIR} || die "Installing rakefile failed."
    
    if use doc; then
	dohtml -r html/* || die "Installing html documentation failed."
    fi
    
    if use examples; then
	docinto "examples"
	dodoc doc/examples/* || die "Installing examples failed."
    fi
}
