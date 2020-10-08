# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

PN_NB="${PN//-bin/}"
PN_NBV="${PN_NB}-${PV}"
GITHUB_RELEASE="https://github.com/zsa/${PN_NB}/releases/download"

DESCRIPTION="Firmware flashing tool for ZSA Keyboards"
HOMEPAGE="https://ergodox-ez.com/pages/${PN_NB}"
SRC_URI="${GITHUB_RELEASE}/${PV}-linux/${PN_NB} -> ${PN_NBV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	virtual/libusb:1
	net-libs/webkit-gtk"
RDEPEND="${DEPEND}"
BDEPEND=""
RESTRICT+=" mirror"

S="${WORKDIR}"

src_unpack()
{
	cp -L "${DISTDIR}/${PN_NB_V}" "${S}/${PN_NB}" || die
}

src_install()
{
	udev_dorules "${FILESDIR}/50-wally.rules"
	udev_reload
	dobin "${PN_NB}"
}
