# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit distutils-r1 git-2

EGIT_REPO_URI="git://github.com/wimmuskee/readability-score.git"
DESCRIPTION="This Python library can calculate the readability score of a text."
HOMEPAGE="http://github.com/wimmuskee/readability-score"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
# eix myspell | grep app-dicts | cut -d '-' -f 3 | tr '\n' ' '
LANGS="af bg ca cs cy da de de_1901 el en eo es et fo fr ga gl he hr hu ia id is it km ku lt lv mi mk ms nb nl nn pl pt pt ro ru sk sl sq sv sw tn uk zu"
for lang in ${LANGS} ; do
    IUSE+=" l10n_${lang}"
done

# dictionaries, code copied from libreoffice-l10n
for lang in ${LANGS} ; do
	SPELL_DICTS_DEPEND+=" l10n_${lang}? ( app-dicts/myspell-${lang} )"
done

RDEPEND="${SPELL_DICTS_DEPEND}"
unset lang LANGS SPELL_DICTS_DEPEND

RDEPEND+="
	dev-python/nltk
	dev-python/hyphenator"
