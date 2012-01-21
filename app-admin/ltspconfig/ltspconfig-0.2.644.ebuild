# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="GUI for configuring a ltsp server in a simple way."
HOMEPAGE="http://lihuen.linti.unlp.edu.ar/index.php/Ltspconfig"
SRC_URI="http://sourceforge.net/projects/ltspconfig/files/Current/${PN}-0.2_644.tar.gz"
LICENSE="GPL=1"
SLOT="0"
KEYWORDS=""
#IUSE="gnome X"

DEPEND=""
RDEPEND="${DEPEND}"


S="${WORKDIR}/${PN}-$(echo ${PV} | sed s/_/./)"


