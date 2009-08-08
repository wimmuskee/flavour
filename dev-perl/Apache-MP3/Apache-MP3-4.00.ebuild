# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Generate streamable directories of MP3 and Ogg Vorbis files."
HOMEPAGE="http://search.cpan.org/dist/Apache-MP3/"
SRC_URI="http://search.cpan.org/CPAN/authors/id/L/LD/LDS/Apache-MP3-4.00.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~x86"

IUSE="ogg wav"

WWW_DIR="/var/www/localhost"

DEPEND="dev-lang/perl"

RDEPEND="${DEPEND}
    >=www-servers/apache-2.0.0
    >=www-apache/mod_perl-2.0.0
    >=perl-core/locale-maketext-1.03
    >=dev-perl/CGI-Session-4.03
    >=dev-perl/MP3-Info-0.8
    wav? ( >=dev-perl/Audio-Wav-0.02 )
    ogg? ( >=dev-perl/libvorbis-perl-0.02 
	>=dev-perl/ogg-vorbis-header-0.02 )"

src_install() {
    perl-module_src_install
    
    # installing default skin
    mkdir -p "${D}${WWW_DIR}"
    cp -r apache_mp3 "${D}${WWW_DIR}" || die "Installing default skin failed."
}

pkg_postinst() {
    perl-module_pkg_postinst
    einfo ""
    einfo "Skin directory copied to ${WWW_DIR}/apache_mp3".
	einfo ""
}
