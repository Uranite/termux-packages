TERMUX_PKG_HOMEPAGE=https://github.com/dnjulek/vapoursynth-ssimulacra2
TERMUX_PKG_DESCRIPTION="SSIMULACRA2 for VapourSynth with Zig"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.0.0"
TERMUX_PKG_SRCURL="https://github.com/dnjulek/vapoursynth-ssimulacra2/archive/refs/heads/main.zip"
TERMUX_PKG_SHA256=97f1c242c9571a5d530f8afaef25ab980d53c6b06669c5b3fc95c0af01506155
TERMUX_PKG_DEPENDS="libc++, ndk-multilib"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_ZIG_VERSION=0.12.0

termux_step_make() {
	termux_setup_zig
	zig build -Dtarget=$ZIG_TARGET_NAME -Doptimize=ReleaseFast --search-prefix $HOME/system/
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/lib/vapoursynth/ zig-out/lib/libssimulacra2.so
}
