# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="LTSP Cluster loadbalancer server"
HOMEPAGE="http://www.ltsp-cluster.org/"
SRC_URI="http://launchpad.net/ltsp-cluster/trunk/current/+download/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"


src_install() {
    distutils_src_install
    newconfd "${FILESDIR}/${PN}.confd" ${PN}
    newinitd "${FILESDIR}/${PN}.initd" ${PN}
}