# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Works based on L-SMASH project"
HOMEPAGE="https://github.com/AkarinVS/L-SMASH-Works"

SRC_URI="https://github.com/AkarinVS/L-SMASH-Works/archive/refs/tags/vA.3i.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE=""
SLOT="0"
IUSE="-static-libs -debug"

RDEPEND="
	media-video/ffmpeg
	media-libs/l-smash
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"

S="${WORKDIR}/L-SMASH-Works-vA.3i"

src_configure() {
	meson setup "${S}/VapourSynth"
}
