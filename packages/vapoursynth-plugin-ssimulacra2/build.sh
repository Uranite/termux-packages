TERMUX_PKG_HOMEPAGE=https://github.com/dnjulek/vapoursynth-ssimulacra2
TERMUX_PKG_DESCRIPTION="SSIMULACRA2 for VapourSynth with Zig"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="None"
TERMUX_PKG_VERSION="1.0.0"
TERMUX_PKG_SRCURL="https://github.com/Uranite/vapoursynth-ssimulacra2/archive/refs/heads/main.zip"
TERMUX_PKG_SHA256=1cbdeb092a9763014136d874e99ddf15308e65b430f8279565dc09fb73eb0711
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_zig
	zig build -Dtarget=$ZIG_TARGET_NAME -Doptimize=ReleaseFast
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/lib/vapoursynth/ zig-out/lib/libssimulacra2.so
}
