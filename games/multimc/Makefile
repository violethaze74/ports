COMMENT =		free and open-source launcher for Minecraft

# git clone --recurse-submodules -b 0.6.12 https://github.com/MultiMC/MultiMC5
DISTNAME =		multimc-0.6.12
MASTER_SITES =		https://distfiles.yukiisbo.red/
REVISION =		0

CATEGORIES =		games

HOMEPAGE =		https://multimc.org

# Apache 2.0
PERMIT_PACKAGE =	Yes

WANTLIB +=		${COMPILER_LIBCXX} Qt5Concurrent Qt5Core Qt5Gui
WANTLIB +=		Qt5Network Qt5Widgets Qt5Xml c m z

MODULES =		devel/cmake \
			x11/qt5 \
			java
MODJAVA_VER =		11

RUN_DEPENDS =		audio/openal \
			games/lwjgl3 \
			java/javaPathHelper

# Keep lwjgl directory for the optional dependency
CXXFLAGS +=	-DLWJGL_DIR='\"${LOCALBASE}/share/lwjgl/\"' \
		-DLWJGL3_DIR='\"${LOCALBASE}/share/lwjgl3/\"' \
		-DJAVAPATHHELPER_PATH='\"${LOCALBASE}/bin/javaPathHelper\"' \
		-Wno-error

CONFIGURE_ARGS =	-DMultiMC_LAYOUT="lin-system"

WRKDIST =		${WRKDIR}/MultiMC5

.include <bsd.port.mk>
