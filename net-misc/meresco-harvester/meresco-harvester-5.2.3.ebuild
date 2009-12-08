# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="The OAI-Harvester from MERESCO, a next generation library of components for (meta)data management."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://www.cq2.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL"
SLOT="0"
IUSE="doc examples"
KEYWORDS="~amd64 ~x86"

WEBDATADIR="/var/lib/${PN}"

DEPEND=""

RDEPEND="${DEPEND}
	=dev-python/amara-1.2.0.2
	>=dev-python/slowfoot-7.2
	=dev-python/cq2utils-old-5.4*
	>=www-servers/apache-2.2.3[apache2_mpms_worker,apache2_modules_rewrite,apache2_modules_proxy,apache2_modules_proxy_http,apache2_modules_authz_host,apache2_modules_mime,apache2_modules_alias,apache2_modules_cache,ssl]"

src_install() {
    distutils_src_install

    # preparing web document root
    dodir "${WEBDATADIR}/data"
    dodir "${WEBDATADIR}/state"
    insinto ${WEBDATADIR}
    doins examples/users.txt
    doins examples/startharvester.py
    fowners -R apache:apache ${WEBDATADIR} || die "Setting permissions on web data directory failed."

    # copy sitecustomize for default utf8 encoding if it doesn't exist
    # this should be changed upstream
    if [ -e "/usr/lib/python${PYVER}/site-packages/sitecustomize.py" ]; then
		insinto ${WEBDATADIR}
		SITECUSTOMIZE=""
    else
		insinto "/usr/lib/python${PYVER}/site-packages"	
    fi

    doins "${FILESDIR}/sitecustomize.py"

    # installing init files
    newconfd "${FILESDIR}/meresco-harvester_conf.d" ${PN}
    newinitd "${FILESDIR}/meresco-harvester_init.d" ${PN}

    # copy docs
    if use doc; then
		dodoc doc/* || die "Installing docs failed."
    fi

    # copy examples
    if use examples; then
    	docinto examples
		dodoc examples/meresco-harvester.apache.conf || die "Installing examples failed."
    fi
}

pkg_postinst() {
    if [ -z ${SITECUSTOMIZE} ]; then
	ewarn "The sitecustomize.py file was not copied to /usr/lib/python${PYVER}/site-packages"
	ewarn "because a copy existed already at that location. Merge our copy with the one on"
	ewarn "the filesystem. The provided one is copied to ${WEBDATADIR}."
	echo ""
    fi
    
    einfo "Web accessible data storage is setup in ${WEBDATADIR}."
    einfo ""
    einfo "Don't forget to set a domain in /etc/conf.d/meresco-harvester before"
    einfo "starting it through init.d."
}