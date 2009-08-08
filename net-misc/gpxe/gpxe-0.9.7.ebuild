# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="gPXE is an open source (GPL) network bootloader."
HOMEPAGE="http://etherboot.org"
SRC_URI="http://kernel.org/pub/software/utils/boot/gpxe/gpxe-0.9.7.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"


# BUILD TO ISO
# use flags determine which iso's are built


#cd dependent on cdrtools
#in src/util/geniso  geen mkisofs -q, remove -q optie 
