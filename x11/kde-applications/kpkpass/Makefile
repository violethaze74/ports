COMMENT =	KDE PIM Apple wallet file support library
DISTNAME =	kpkpass-${VERSION}
CATEGORIES =	devel

SHARED_LIBS +=  KPim5PkPass               0.0 # 0.0

WANTLIB += ${COMPILER_LIBCXX} KF5Archive Qt5Core Qt5Gui m

MODKDE5_TRANSLATIONS = yes

LIB_DEPENDS =	devel/kf5/karchive
RUN_DEPENDS =	misc/shared-mime-info

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
