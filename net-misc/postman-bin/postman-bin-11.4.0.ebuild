# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
MY_PN=${PN/-bin/}

inherit desktop xdg

DESCRIPTION="API platform for building and using APIs"
HOMEPAGE="https://www.postman.com/"
SRC_URI="https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}.tar.gz"
S="${WORKDIR}/Postman/app"
LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip mirror"

src_install() {
	installdir="/opt/${MY_PN}"
	insinto ${installdir}
	doins -r *

	exeinto ${installdir}
	doexe Postman
	doexe postman
	doexe chrome_crashpad_handler
	doexe chrome-sandbox

	dosym ${installdir}/Postman /usr/bin/${MY_PN}

	newicon resources/app/assets/icon.png postman.png

	make_desktop_entry "postman %U" \
		"Postman" \
		"postman" \
		"Development;Utility;" \
		"StartupWMClass=postman\nMimeType=x-scheme-handler/postman"
}
