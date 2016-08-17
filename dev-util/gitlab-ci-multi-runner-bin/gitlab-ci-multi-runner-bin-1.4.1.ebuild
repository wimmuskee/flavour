# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit systemd

DESCRIPTION="The binary Debian package of the GitLab CI Runner."
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-ci-multi-runner"
LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64"
SRC_URI="http://httpredir.debian.org/debian/pool/main/g/gitlab-ci-multi-runner/gitlab-ci-multi-runner_${PV}+dfsg-1_amd64.deb"
RESTRICT="mirror"
IUSE="doc docker-build"
DEPEND="app-arch/xz-utils"
RDEPEND="docker-build? ( >=app-emulation/docker-1.5 )"

src_prepare() {
	xz -d data.tar.xz
	tar -xf data.tar -C ${WORKDIR}
}

src_install() {
	# bin
	exeinto /usr/bin
	doexe usr/bin/gitlab-ci-multi-runner
	doexe usr/bin/gitlab-runner-helper
	insinto /usr/bin
	dosym gitlab-ci-multi-runner /usr/bin/gitlab-runner
	
	# lib
	systemd_dounit lib/systemd/system/gitlab-ci-multi-runner.service
	
	if use docker-build; then
		insinto /usr/lib/gitlab-runner
		exeinto /usr/lib/gitlab-runner
		doins usr/lib/gitlab-runner/Dockerfile
		doexe usr/lib/gitlab-runner/gitlab-runner*
		doexe usr/lib/gitlab-runner/mk-prebuilt-images.sh
	fi
	
	# var
	dodir /var/lib/gitlab-runner
	
	# etc
	insinto /etc/default
	doins etc/default/gitlab-ci-multi-runner
	
	insinto /etc/gitlab-runner
	doins etc/gitlab-runner/config.toml
	
	# doc
	cd usr/share/doc/gitlab-ci-multi-runner
	dodoc copyright
	
	# debian already compressed most files here
	# just copying, not double compressing
	if use doc; then
		insinto "/usr/share/doc/${PF}"
		doins changelog.gz
		doins changelog.Debian.gz
		for d in $(find . -type d); do
			doins -r ${d}
		done
	fi
}

pkg_postinst() {
	einfo "Only a systemd init script is installed,"
	einfo "not using the Debian init script."
	einfo ""
	einfo "Also, the /var/cache/gitlab-runner directory has not been created."
}
