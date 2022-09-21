# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools llvm multiprocessing pax-utils toolchain-funcs cargo git-r3

DESCRIPTION="A cross-platform all-in-one tool for streamlining AV1 encoding"
HOMEPAGE="https://github.com/master-of-zen/Av1an"

EGIT_REPO_URI="https://github.com/master-of-zen/Av1an.git"

S="${WORKDIR}/${P}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="lsmash ffms2"

RDEPEND="
	media-libs/vapoursynth
	lsmash? ( media-libs/vapoursynth-plugin-lsmashsource )
	ffms2? ( media-video/ffms2 )
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-lang/rust
	dev-lang/nasm
"

src_prepare() {
	default
	# Make cargo respect MAKEOPTS
        export CARGO_BUILD_JOBS="$(makeopts_jobs)"
}

src_compile() {
	cargo build --release
}

src_install() {
	insopts -m0755
	insinto /usr/bin
	doins "${S}/target/release/av1an"
}
