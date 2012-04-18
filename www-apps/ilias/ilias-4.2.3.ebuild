# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit webapp

DESCRIPTION="ILIAS, the flexible and powerful open source learning management system"
HOMEPAGE="http://www.ilias.de/"
SRC_URI="http://downloads.sourceforge.net/ilias/${P}.zip"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
LANGS="ar bg cs da de el en es et fr hu it ja lt nl pl pt ro ru sk sq sr tr uk vi zh"
for X in ${LANGS} ; do
    IUSE="${IUSE} linguas_${X}"
done
DEPEND=""
RDEPEND="${DEPEND}
	>=www-servers/apache-2.2
	>=dev-lang/php-5.2.6[gd,mysql,xml,xsl]
	>=virtual/mysql-5.0
	media-gfx/imagemagick[jpeg,png]
	dev-php/pear
	dev-php/PEAR-Auth
	dev-php/PEAR-MDB2[mysql]
	dev-php/PEAR-HTML_Template_IT
	dev-php/PEAR-Spreadsheet_Excel_Writer"

src_install() {
	webapp_src_preinst
	cd ${PN}
	
	# move current lang to temp dir and
	# copy only the linguas to the lang dir
	mv lang all-lang
	mkdir lang
	
	for x in ${LINGUAS}; do
		mv "all-lang/ilias_${x}.lang" "lang/ilias_${x}.lang"
		mv "all-lang/setup_${x}.lang" "lang/setup_${x}.lang"
	done
	mv all-lang/setup_lang_sel_multi.lang lang/setup_lang_sel_multi.lang
	rm -rf all-lang
	
	# creating the docs and removing from source
	dodoc docs/* 
	docinto customizing
	dodoc Customizing/README.txt
	rm -rf docs Customizing
	
	# install the remainder 
	insinto ${MY_HTDOCSDIR}
	doins -r .
	
	webapp_configfile ${MY_HTDOCSDIR}/ilias.ini.php
	webapp_postinst_txt en "${FILESDIR}/postinstall.txt"
	webapp_src_install
}
