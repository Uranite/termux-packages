TERMUX_PKG_HOMEPAGE=https://www.vapoursynth.com/
TERMUX_PKG_DESCRIPTION="A video processing framework with simplicity in mind"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=71
TERMUX_PKG_SRCURL=https://github.com/vapoursynth/vapoursynth/archive/refs/tags/R${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_DEPENDS="python, libzimg"
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel, 'Cython>=3.0.0'"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	./autogen.sh
	if [ "$TERMUX_ARCH" = "arm" ]; then
		CFLAGS+=" -march=armv7-a"
		CXXFLAGS+=" -march=armv7-a"
	fi
}

termux_step_configure() {
	./configure --prefix=$PREFIX --host=$TERMUX_HOST_PLATFORM
}

termux_step_make_install() {
	make install
	pip install . --prefix=$PREFIX --no-deps --no-build-isolation
}
