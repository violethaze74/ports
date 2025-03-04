COMMENT =	KDE terminal emulator
DISTNAME =	konsole-${VERSION}
CATEGORIES =	editors x11

SHARED_LIBS +=  konsoleprivate            10.0 # 17.08
SHARED_LIBS +=  konsoleapp                3.0 # 21

WANTLIB += ${COMPILER_LIBCXX} KF5Attica KF5Auth KF5AuthCore KF5Bookmarks
WANTLIB += KF5Codecs KF5Completion KF5ConfigCore KF5ConfigGui
WANTLIB += KF5ConfigWidgets KF5CoreAddons KF5Crash KF5DBusAddons
WANTLIB += KF5GlobalAccel KF5GuiAddons KF5I18n KF5IconThemes KF5JobWidgets
WANTLIB += KF5KIOCore KF5KIOGui KF5KIOWidgets KF5NewStuff KF5NewStuffCore
WANTLIB += KF5NewStuffWidgets KF5Notifications KF5NotifyConfig
WANTLIB += KF5Parts KF5Pty KF5Service KF5Solid KF5SonnetUi KF5TextWidgets
WANTLIB += KF5WidgetsAddons KF5WindowSystem KF5XmlGui Qt5Concurrent
WANTLIB += Qt5Core Qt5DBus Qt5Gui Qt5Multimedia Qt5Network Qt5PrintSupport
WANTLIB += Qt5Widgets Qt5Xml X11 c icui18n icuuc m z

MODKDE5_DESKTOP_FILE = yes
MODKDE5_TRANSLATIONS = yes
MODKF5_L10N_CONFLICT = yes
MODKDE5_DOCS = yes

BUILD_DEPENDS =	devel/kf5/kinit
RUN_DEPENDS =	devel/kf5/kinit

LIB_DEPENDS =	devel/kf5/attica \
		devel/kf5/kglobalaccel \
		devel/kf5/kcodecs \
		devel/kf5/kbookmarks \
		devel/kf5/kcompletion \
		devel/kf5/kconfigwidgets \
		devel/kf5/kdbusaddons \
		devel/kf5/kiconthemes \
		devel/kf5/ki18n \
		devel/kf5/kparts \
		devel/kf5/kio \
		devel/kf5/kservice \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kpty \
		devel/kf5/knotifyconfig \
		devel/kf5/kconfig \
		devel/kf5/kcrash \
		devel/kf5/kguiaddons \
		devel/kf5/knotifications \
		devel/kf5/ktextwidgets \
		devel/kf5/knewstuff \
		devel/kf5/kwindowsystem \
		devel/kf5/kcoreaddons \
		devel/kf5/kxmlgui \
		x11/qt5/qtmultimedia

TEST_IS_INTERACTIVE =	X11
TEST_DEPENDS =		${BUILD_PKGPATH}

.include <bsd.port.mk>
