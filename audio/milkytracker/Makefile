COMMENT =	Fasttracker II inspired MOD tracker

GH_ACCOUNT =	milkytracker
GH_PROJECT =	MilkyTracker
GH_TAGNAME =	v1.03.00

PKGNAME =	${DISTNAME:L}
REVISION =	0

CATEGORIES =	audio

HOMEPAGE =	https://milkytracker.org/

# GPLv3+
PERMIT_PACKAGE =	Yes

WANTLIB +=	SDL2 c m ${COMPILER_LIBCXX} z zzip

COMPILER =		base-clang ports-gcc base-gcc

MODULES =	devel/cmake

BUILD_DEPENDS =	audio/jack

# libjack accessed via dlopen()
RUN_DEPENDS =	audio/jack \
		devel/desktop-file-utils \
		x11/gtk+4,-guic

LIB_DEPENDS =	archivers/zziplib \
		devel/sdl2

CONFIGURE_ARGS = -DCMAKE_INSTALL_DOCDIR=${PREFIX}/share/doc/milkytracker

NO_TEST =	Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/resources/milkytracker.desktop \
		${PREFIX}/share/applications
	${INSTALL_DATA_DIR} ${PREFIX}/share/icons/hicolor/128x128/apps
	${INSTALL_DATA} ${WRKSRC}/resources/pictures/carton.png \
		${PREFIX}/share/icons/hicolor/128x128/apps/milkytracker.png

.include <bsd.port.mk>
