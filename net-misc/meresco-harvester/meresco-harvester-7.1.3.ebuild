# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="The OAI-Harvester from MERESCO, a next generation library of components for (meta)data management."
HOMEPAGE="http://www.meresco.com"
SRC_URI="http://sources.seecr.nl/opensourcepackages/${P}-src.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE="doc examples"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
WEBDATADIR="/var/lib/${PN}"

DEPEND=""

RDEPEND="${DEPEND}
	=dev-python/amara-1.2.0.2
	>=dev-python/slowfoot-7.3.2
	=dev-python/cq2utils-old-5.4*
	>=www-servers/apache-2.2.3[apache2_mpms_worker,apache2_modules_rewrite,apache2_modules_proxy,apache2_modules_proxy_http,apache2_modules_authz_host,apache2_modules_mime,apache2_modules_alias,apache2_modules_cache,ssl]"

src_install() {
    distutils_src_install

    # preparing web document root
    dodir "${WEBDATADIR}/data"
    dodir "${WEBDATADIR}/state"
    insinto ${WEBDATADIR}
    doins examples/startharvester.py
    fowners -R apache:apache ${WEBDATADIR} || die "Setting permissions on web data directory failed."

    # copy sitecustomize for default utf8 encoding if it doesn't exist
    # this should be changed upstream
    if [ -e "/usr/lib/python${PYVER}/site-packages/sitecustomize.py" ]; then
		insinto ${WEBDATADIR}
		SITECUSTOMIZE=""
    else
		insinto "/usr/lib/python${PYVER}/site-packages"	
		doins "${FILESDIR}/sitecustomize.py"
    fi

    
    # copy docs
    if use doc; then
		dodoc doc/* || die "Installing docs failed."
		dodoc applied/* || die "Installing changelogs failed."
    fi

    # copy examples
    if use examples; then
    	docinto examples
		dodoc examples/meresco-harvester.apache.conf || die "Installing examples failed."
		dodoc examples/users.txt || die "Installing default user file failed."
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
    einfo "Create the admin user by issuing this command:"
    einfo "echo \"admin:\$(echo -n <yourpassword> | md5sum | awk '{print \$1}')\" > ${WEBDATADIR}/users.txt"
    einfo ""
    einfo "Start a harvest run for a specified domain with:"
    einfo "python /var/lib/meresco-harvester/startharvester.py -d <domain>"
}
