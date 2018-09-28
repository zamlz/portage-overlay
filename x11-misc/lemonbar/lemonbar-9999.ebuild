# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="bar ain't recursive - A lightweight xcb based bar."
HOMEPAGE="https://github.com/krypt-n/bar"
EGIT_REPO_URI="https://github.com/krypt-n/bar.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXft"
RDEPEND="${DEPEND}"
BDEPEND=""
