# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="X Window Obfuscator"
HOMEPAGE="https://github.com/glindstedt/xwobf"
EGIT_REPO_URI="https://github.com/glindstedt/xwobf.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	x11-libs/libxcb
	media-gfx/imagemagick"
RDEPEND="${DEPEND}"
BDEPEND=""
