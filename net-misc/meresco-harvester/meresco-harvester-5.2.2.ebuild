# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="The OAI-Harvester from MERESCO, a next generation library of components for (meta)data management."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://www.cq2.nl/opensourcepackages/meresco-harvester-5.2.2-src.tar.gz"
LICENSE="GPL"
SLOT="0"
IUSE="doc examples"
KEYWORDS="~x86"

DEPEND=""

RDEPEND="${DEPEND}
	=dev-python/amara-1.2.0.2
	>=dev-python/slowfoot-7.2
	=dev-python/cq2utils-old-5.4*
	>=www-servers/apache-2.2.3[apache2_mpms_worker,apache2_modules_rewrite,apache2_modules_proxy,apache2_modules_proxy_http,apache2_modules_authz_host,apache2_modules_mime,apache2_modules_alias,apache2_modules_cache,ssl]"

src_install() {
    distutils_src_install
    
    # copy docs
    if use doc; then
		dodoc doc/* || die "Installing docs failed."
    fi
    
    # copy examples
    if use examples; then
    	docinto "examples"
		dodoc examples/* || die "Installing examples failed."
    fi
}