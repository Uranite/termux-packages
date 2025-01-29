TERMUX_PKG_HOMEPAGE=https://github.com/fcorbelli/zpaqfranz
TERMUX_PKG_DESCRIPTION="Deduplicating archiver with encryption and paranoid-level tests. ZPAQ 7.15 fork."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=60.10
TERMUX_PKG_SRCURL=https://github.com/fcorbelli/zpaqfranz/archive/refs/tags/${TERMUX_PKG_VERSION}.zip
TERMUX_PKG_SHA256=7016cd89ee518092c488b9c5a0937d1f3a567df32810cd9b19623e8ca3f2c3a5
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BUILD_DEPENDS="perl"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	CXXFLAGS+=" -O3"
	if [ $TERMUX_ARCH = "aarch64" ]; then
		CPPFLAGS+=" -DNOJIT"
	elif [ $TERMUX_ARCH = "arm" ]; then
		CPPFLAGS+=" -DNOJIT"
	elif [ $TERMUX_ARCH = "i686" ]; then
		CPPFLAGS+=" -Dunix"
	elif [ $TERMUX_ARCH = "x86_64" ]; then
		CPPFLAGS+=" -Dunix"
	fi
}
