COMMENT =	mail sieve editor
DISTNAME =	pim-sieve-editor-${VERSION}
CATEGORIES =	devel

SHARED_LIBS +=  sieveeditor       3.0 # 5.13.2

WANTLIB += ${COMPILER_LIBCXX} KF5Auth KF5AuthCore KF5Bookmarks
WANTLIB += KF5Codecs KF5ConfigCore KF5ConfigGui KF5ConfigWidgets
WANTLIB += KF5CoreAddons KF5Crash KF5DBusAddons KF5I18n KF5KIOCore
WANTLIB += KF5PimCommon KF5Service KF5TextAutoCorrectionCore KF5TextAutoCorrectionWidgets
WANTLIB += KF5TextEditTextToSpeech KF5Wallet KF5WidgetsAddons
WANTLIB += KF5XmlGui KPim5KManageSieve KPim5KSieve KPim5KSieveUi
WANTLIB += KPim5MailTransport KPim5TextEdit KUserFeedbackCore
WANTLIB += KUserFeedbackWidgets Qt5Concurrent Qt5Core Qt5DBus
WANTLIB += Qt5Gui Qt5Network Qt5Widgets Qt5Xml c m qt5keychain

MODKDE5_TRANSLATIONS = yes
MODKDE5_DESKTOP_FILE = yes

MODKF5_L10N_CONFLICT = yes
MODKF5_I18N_CONFLICT = yes

LIB_DEPENDS =	devel/kf5/kauth \
		devel/kf5/kbookmarks \
		devel/kf5/kcodecs \
		devel/kf5/kconfig \
		devel/kf5/kconfigwidgets \
		devel/kf5/kcoreaddons \
		devel/kf5/kcrash \
		devel/kf5/kdbusaddons \
		devel/kf5/ki18n \
		devel/kf5/kio \
		devel/kf5/kservice \
		devel/kf5/kwallet \
		devel/kf5/kwidgetsaddons \
		devel/kf5/kxmlgui \
		productivity/kuserfeedback \
		x11/kde-applications/kmailtransport \
		x11/kde-applications/libksieve \
		x11/kde-applications/pimcommon

TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
