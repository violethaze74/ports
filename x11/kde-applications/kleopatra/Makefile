COMMENT =	certificate manager and a universal crypto GUI
DISTNAME =	kleopatra-${VERSION}
CATEGORIES =	security x11

SHARED_LIBS +=  kleopatraclientcore     1.0 # 1.3.0
SHARED_LIBS +=  kleopatraclientgui      1.0 # 1.3.0

WANTLIB += ${COMPILER_LIBCXX} KF5Auth KF5AuthCore KF5Codecs KF5ConfigCore
WANTLIB += KF5ConfigGui KF5ConfigWidgets KF5CoreAddons KF5Crash
WANTLIB += KF5DBusAddons KF5I18n KF5IconThemes KF5ItemModels KF5Notifications
WANTLIB += KF5SonnetUi KF5TextWidgets KF5Wallet KF5WidgetsAddons
WANTLIB += KF5WindowSystem KF5XmlGui KPim5AkonadiCore KPim5AkonadiMime
WANTLIB += KPim5IdentityManagement KPim5Libkleo KPim5MailTransport
WANTLIB += KPim5MailTransportAkonadi KPim5Mime Qt5Core Qt5DBus
WANTLIB += Qt5Gui Qt5Network Qt5PrintSupport Qt5Widgets Qt5Xml
WANTLIB += X11 assuan c gpg-error gpgme gpgmepp m qgpgme

MODKDE5_DESKTOP_FILE = yes
MODKDE5_ICON_CACHE = yes
MODKDE5_TRANSLATIONS = yes
MODKDE5_DOCS = yes

MODKF5_I18N_CONFLICT = yes
MODKF5_L10N_CONFLICT = yes

RUN_DEPENDS =	security/gnupg \
		misc/shared-mime-info

BUILD_DEPENDS =	devel/boost \
		devel/git

LIB_DEPENDS =	devel/kf5/kauth \
		devel/kf5/kcodecs \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/kcrash \
		devel/kf5/kdbusaddons \
		devel/kf5/kiconthemes \
		devel/kf5/kitemmodels \
		devel/kf5/knotifications \
		devel/kf5/ktextwidgets \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kwindowsystem \
		devel/kf5/kxmlgui \
		devel/kf5/sonnet \
		security/gpgme,-qt \
		security/libassuan \
		security/libgpg-error \
		x11/kde-applications/akonadi \
		x11/kde-applications/akonadi-mime \
		x11/kde-applications/kidentitymanagement \
		x11/kde-applications/kmailtransport \
		x11/kde-applications/kmime \
		x11/kde-applications/libkleo

CXXFLAGS +=	-I${LOCALBASE}/include/KPim5/Libkleo/
CFLAGS +=	-I${LOCALBASE}/include/KPim5/Libkleo/

.include <bsd.port.mk>
