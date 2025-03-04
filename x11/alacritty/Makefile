COMMENT =	cross-platform, GPU-accelerated terminal emulator
CATEGORIES =	x11

MAINTAINER =	Eric Auge <eau+obsd@unix4fun.net>

GH_ACCOUNT =	alacritty
GH_PROJECT =	alacritty
GH_TAGNAME =	v0.12.1

HOMEPAGE =	https://alacritty.org/

# Apache 2.0
PERMIT_PACKAGE =	Yes

WANTLIB += c c++abi fontconfig freetype m pthread util
# xcb is dlopen()'d
WANTLIB += xcb

MODULES =	devel/cargo \
		lang/python

RUN_DEPENDS =	devel/desktop-file-utils

# for riscv64 and powerpc64, please keep: cc >= 1.0.73 and libc >= 0.2.113
MODCARGO_CRATES_UPDATE =	cc libc
MODCARGO_RUSTFLAGS += -L${PREFIX}/lib

# Disable wayland feature. Breaks the build if libxkbcommon is absent
# copypasta/wayland -> smithay-client-toolkit, glutin.
# ld: error: unable to find library -lxkbcommon
MODCARGO_NO_DEFAULT_FEATURES =	Yes
MODCARGO_FEATURES =		x11

MAKE_ENV =	${MODCARGO_ENV}

CONFIGURE_STYLE =	cargo

SEPARATE_BUILD =	Yes

RELEASE_DIR =	${MODCARGO_TARGET_DIR}/release
EXTRA_DIR = 	${WRKSRC}/extra

# test result: FAILED. 68 passed; 1 failed;
# failed test: config::tests::config_read_eof
# because we patch the default configuration value
# for live_config_reload

do-install:
	${INSTALL_PROGRAM} ${RELEASE_DIR}/alacritty ${PREFIX}/bin/
	${INSTALL_MAN} ${EXTRA_DIR}/alacritty.man ${PREFIX}/man/man1/alacritty.1
	${INSTALL_DATA_DIR} ${PREFIX}/share/bash-completion/completions
	${INSTALL_DATA} ${EXTRA_DIR}/completions/alacritty.bash \
		${PREFIX}/share/bash-completion/completions/alacritty
	${INSTALL_DATA_DIR} ${PREFIX}/share/fish/completions
	${INSTALL_DATA} ${EXTRA_DIR}/completions/alacritty.fish \
		${PREFIX}/share/fish/completions/
	${INSTALL_DATA_DIR} ${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${EXTRA_DIR}/completions/_alacritty \
		${PREFIX}/share/zsh/site-functions/_alacritty
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${EXTRA_DIR}/linux/Alacritty.desktop \
		${PREFIX}/share/applications/
	${INSTALL_DATA_DIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${EXTRA_DIR}/logo/alacritty-term.svg \
		${PREFIX}/share/pixmaps/Alacritty.svg
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/alacritty
	${INSTALL_DATA} ${WRKSRC}/alacritty.yml \
		${PREFIX}/share/examples/alacritty/alacritty.yml
	tic -s -x -o ${PREFIX}/share/terminfo ${EXTRA_DIR}/alacritty.info

.include "crates.inc"

.include <bsd.port.mk>
