COMMENT =	library for reading and writing vocabulary
DISTNAME =	libkeduvocdocument-${VERSION}
CATEGORIES =	education x11

SHARED_LIBS +=  KEduVocDocument           3.0 # 5.0

WANTLIB += ${COMPILER_LIBCXX} KF5Archive KF5ConfigCore KF5CoreAddons
WANTLIB += KF5I18n KF5KIOCore KF5Service Qt5Concurrent Qt5Core
WANTLIB += Qt5DBus Qt5Network Qt5Xml m

MODKDE5_TRANSLATIONS = yes

LIB_DEPENDS =	devel/kf5/karchive \
		devel/kf5/kconfig \
		devel/kf5/kcoreaddons \
		devel/kf5/kservice \
		devel/kf5/ki18n \
		devel/kf5/kio

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
