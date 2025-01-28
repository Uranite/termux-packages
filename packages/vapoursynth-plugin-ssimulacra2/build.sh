TERMUX_PKG_HOMEPAGE=https://github.com/dnjulek/vapoursynth-ssimulacra2
TERMUX_PKG_DESCRIPTION="SSIMULACRA2 for VapourSynth with Zig"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="None"
TERMUX_PKG_VERSION="1.0.0"
TERMUX_PKG_SRCURL="https://github.com/Uranite/vapoursynth-ssimulacra2/archive/refs/heads/main.zip"
TERMUX_PKG_SHA256=17609f65a336fda61484558dc7598b635a4d46301bb2de8875eb8eba73575676
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_zig
	zig build -Dtarget=$ZIG_TARGET_NAME -Doptimize=ReleaseFast
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/lib/vapoursynth/ zig-out/lib/libssimulacra2.so
}
