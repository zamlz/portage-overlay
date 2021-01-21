# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

PN_NB="${PN//-bin/}"
GITHUB="https://github.com/project-${PN_NB}"
GITHUB_RELEASE="${GITHUB}/Ishiiruka/releases/download"

APP_IMAGE="Slippi_Online-x86_64.AppImage"
APP_IMAGE_PV="${APP_IMAGE//.AppImage/}-v${PV}.AppImage"

DESCRIPTION="Dolphin Emulator with Rollback Netcode for Super Smash Bros. Melee"
HOMEPAGE=(
	"https://slippi.gg/"
	"${GITHUB}"
)
LICENSE="GPL-2"

SLOT="0"
SRC_URI=(
	"${GITHUB_RELEASE}/v${PV}/${APP_IMAGE} -> ${APP_IMAGE_PV}"
)
KEYWORDS="-* amd64"
IUSE=""
RDEPEND="sys-fs/fuse:0
	app-crypt/p11-kit"

RESTRICT+=" mirror"

S="${WORKDIR}"

src_unpack()
{
	cp -L "${DISTDIR}/${APP_IMAGE_PV}" "${S}/${PN_NB}" || die
}

src_install()
{
	udev_dorules "${FILESDIR}/51-gcadapter.rules"
	udev_reload
	dobin "${PN_NB}"
}
