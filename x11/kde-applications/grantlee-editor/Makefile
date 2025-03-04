USE_WXNEEDED =	Yes

COMMENT =	utilities and tools to manage themes in KDE PIM applications
DISTNAME =	grantlee-editor-${VERSION}
CATEGORIES =	devel

SHARED_LIBS +=  grantleethemeeditor       1.0 # 5.13.2
WANTLIB += ${COMPILER_LIBCXX} Grantlee_Templates KF5Archive KF5Auth
WANTLIB += KF5AuthCore KF5Codecs KF5Completion KF5ConfigCore KF5ConfigGui
WANTLIB += KF5ConfigWidgets KF5Contacts KF5CoreAddons KF5Crash
WANTLIB += KF5DBusAddons KF5I18n KF5ItemModels KF5JobWidgets KF5KIOCore
WANTLIB += KF5KIOGui KF5KIOWidgets KF5PimCommon KF5Service KF5Solid
WANTLIB += KF5SyntaxHighlighting KF5TextAutoCorrectionCore KF5TextAutoCorrectionWidgets
WANTLIB += KF5TextEditTextToSpeech KF5WidgetsAddons KF5WindowSystem
WANTLIB += KF5XmlGui KPim5AkonadiContact KPim5AkonadiCore KPim5AkonadiMime
WANTLIB += KPim5AkonadiWidgets KPim5GrantleeTheme KPim5Libkleo
WANTLIB += KPim5MessageCore KPim5MessageViewer KPim5Mime KPim5MimeTreeParser
WANTLIB += KPim5TextEdit Qt5Concurrent Qt5Core Qt5DBus Qt5Gui
WANTLIB += Qt5Network Qt5Positioning Qt5PrintSupport Qt5Qml Qt5QmlModels
WANTLIB += Qt5Quick Qt5WebChannel Qt5WebEngineCore Qt5WebEngineWidgets
WANTLIB += Qt5Widgets Qt5Xml X11 assuan c gpgme gpgmepp m qgpgme

WANTLIB += lib/inotify/inotify

MODKDE5_TRANSLATIONS = yes
MODKDE5_DESKTOP_FILE = yes

MODKF5_L10N_CONFLICT = yes
MODKF5_I18N_CONFLICT = yes

BUILD_DEPENDS =	devel/boost \
		devel/kf5/ktexteditor

RUN_DEPENDS =	x11/kde-applications/kdepim-runtime

LIB_DEPENDS =	devel/kf5/karchive \
		devel/kf5/kauth \
		devel/kf5/kcodecs \
		devel/kf5/kcompletion \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcontacts \
		devel/kf5/kcoreaddons \
		devel/kf5/kcrash \
		devel/kf5/kdbusaddons \
		devel/kf5/ki18n \
		devel/kf5/kio \
		devel/kf5/kitemmodels \
		devel/kf5/kjobwidgets \
		devel/kf5/kservice \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kxmlgui \
		devel/kf5/syntax-highlighting \
		devel/libinotify \
		security/gpgme,-qt \
		x11/kde-applications/akonadi \
		x11/kde-applications/akonadi-mime \
		x11/kde-applications/grantleetheme \
		x11/kde-applications/kmime \
		x11/kde-applications/kpimtextedit \
		x11/kde-applications/messagelib \
		x11/kde-applications/pimcommon \
		x11/qt5/qtlocation \
		x11/qt5/qtwebchannel \
		x11/qt5/qtwebengine

CXXFLAGS +=	-I${LOCALBASE}/include/KPim5/MessageViewer

.include <bsd.port.mk>
