# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

PN_NB="${PN//-bin/}"
APP_IMAGE="Slippi_Online-x86_64.AppImage"

DESCRIPTION="Slippi is a Dolphin Emulator with Rollback Netcode for Super Smash Bros. Melee"
HOMEPAGE=(
	"https://slippi.gg/"
	"https://github.com/project-slippi"
)
LICENSE="GPL-2"

SLOT="0"
SRC_URI=(
	"https://github.com/project-${PN_NB}/Ishiiruka/releases/download/v${PV}/${APP_IMAGE}"
)
KEYWORDS="-* amd64"
IUSE=""
RDEPEND="sys-fs/fuse:0
	app-crypt/p11-kit"

RESTRICT+=" primaryuri"

S="${WORKDIR}"

src_unpack()
{
	cp -L "${DISTDIR}/${APP_IMAGE}" "${S}/${PN_NB}" || die
}

src_install()
{
	udev_dorules "${FILESDIR}/51-gcadapter.rules"
	udev_reload
	dobin "${PN_NB}"
}
