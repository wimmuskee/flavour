# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

SRC_URI_BASE="http://www.imsglobal.org/sites/default/files/xsd"
DESCRIPTION="Bundle of IMS XML validation schemas"
HOMEPAGE="http://www.imsglobal.org/xsd/index.html"
SRC_URI="${SRC_URI_BASE}/ims_xml.xsd
	contentpackage? (
		${SRC_URI_BASE}/imscp_v1p2.xsd
		${SRC_URI_BASE}/imscp_extensionv1p2.xsd
		${SRC_URI_BASE}/ims_xlink.xsd
		${SRC_URI_BASE}/imscp_util.xsd
		${SRC_URI_BASE}/imscp_v1p1.xsd
		${SRC_URI_BASE}/imscp_rootv1p1p2.xsd
		${SRC_URI_BASE}/ims_cp_rootv1p1.xsd )
	metadata? (
		${SRC_URI_BASE}/imsmd_loose_v1p3p2.xsd
		${SRC_URI_BASE}/imsmd_strict_v1p3p2.xsd
		${SRC_URI_BASE}/imsmd_strict_v1p3p1.xsd
		${SRC_URI_BASE}/imsmd_strict_v1p3.xsd
		${SRC_URI_BASE}/imsmd_loose_v1p3.xsd
		${SRC_URI_BASE}/imsmd_v1p2p4.xsd
		${SRC_URI_BASE}/imsmd_v1p2p2.xsd
		${SRC_URI_BASE}/imsmd_rootv1p2p1.xsd
		${SRC_URI_BASE}/imsmd_rootv1p2.xsd
		${SRC_URI_BASE}/ims_md_rootv1p1.xsd )
	qti? (
		${SRC_URI_BASE}/imsqti_item_v2p0.xsd
		${SRC_URI_BASE}/imsqti_item_v2p0.dtd
		${SRC_URI_BASE}/ims_qtiresv1p2p1.xsd
		${SRC_URI_BASE}/ims_qtilitev1p2p1.xsd
		${SRC_URI_BASE}/ims_qtiasiv1p2p1.xsd
		${SRC_URI_BASE}/ims_qti_rootv1p1.xsd
		${SRC_URI_BASE}/ims_qtil_rootv1p1.xsd
		${SRC_URI_BASE}/ims_qti_rootv1p01.xsd )
	vdex? (
		${SRC_URI_BASE}/imsvdex_v1p0.xsd
		${SRC_URI_BASE}/imsvdex_v1p0_flat.xsd
		${SRC_URI_BASE}/imsvdex_v1p0_glossary.xsd
		${SRC_URI_BASE}/imsvdex_v1p0_hierarchical.xsd
		${SRC_URI_BASE}/imsvdex_v1p0_thesaurus.xsd
		${SRC_URI_BASE}/imsvdex_v1p0_lax.xsd )"
SLOT="0"
KEYWORDS="amd64 arm x86"
LICENSE="all-rights-reserved"
RESTRICT="mirror"
IUSE="contentpackage metadata qti vdex"
DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir "${WORKDIR}/${P}"
	for schema in ${A}; do
		cp "${DISTDIR}/${schema}" "${WORKDIR}/${P}"
	done
}

src_install() {
	insinto /usr/share/xml/ims
	doins ims_xml.xsd

	if use contentpackage; then
		doins ims_cp_rootv1p1.xsd
		doins ims_xlink.xsd
		for cp_type in "v1p2" "extensionv1p2" "util" "v1p1" "rootv1p1p2"; do
			doins "imscp_${cp_type}.xsd"
		done
	fi

	if use metadata; then
		doins ims_md_rootv1p1.xsd
		for md_type in "loose_v1p3p2" "strict_v1p3p2" "strict_v1p3p1" "strict_v1p3" "loose_v1p3" "v1p2p4" "v1p2p2" "rootv1p2p1" "rootv1p2"; do
			doins "imsmd_${md_type}.xsd"
		done
	fi

	if use qti; then
		doins imsqti_item_v2p0.xsd
		doins imsqti_item_v2p0.dtd
		for cp_type in "resv1p2p1" "litev1p2p1" "asiv1p2p1" "_rootv1p1" "l_rootv1p1" "_rootv1p01"; do
			doins "ims_qti${cp_type}.xsd"
		done
	fi

	if use vdex; then
		doins imsvdex_v1p0.xsd
		for vdex_type in "flat" "glossary" "hierarchical" "thesaurus" "lax"; do
			doins "imsvdex_v1p0_${vdex_type}.xsd"
		done
	fi
}

pkg_postinst() {
	einfo "Installed selected schema files in /usr/share/xml/ims"
}
