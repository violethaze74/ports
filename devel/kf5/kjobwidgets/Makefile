COMMENT =	KDE widgets for showing progress of asynchronous jobs
DISTNAME =	kjobwidgets-${VERSION}

SHARED_LIBS =	KF5JobWidgets		6.0

WANTLIB += ${COMPILER_LIBCXX} KF5CoreAddons KF5WidgetsAddons Qt5Core
WANTLIB += Qt5DBus Qt5Gui Qt5Widgets Qt5X11Extras m

LIB_DEPENDS =	devel/kf5/kcoreaddons>=${MODKF5_VERSION} \
		devel/kf5/kwidgetsaddons>=${MODKF5_VERSION} \
		x11/qt5/qtx11extras

DEBUG_PACKAGES =	${BUILD_PACKAGES}

CONFIGURE_ARGS =	-DBUILD_TESTING=ON

.include <bsd.port.mk>
