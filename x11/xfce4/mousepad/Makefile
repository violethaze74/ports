COMMENT=	Xfce4 simple text editor

XFCE_VERSION=	0.6.1
XFCE_GOODIE=	mousepad

SHARED_LIBS +=	mousepad	1.0 # 0.0

# GPLv2
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4
MODXFCE_DESKTOP_FILE=	Yes
MODXFCE_ICON_CACHE=	Yes
MODXFCE_PURGE_LA=	lib lib/mousepad/plugins

LIB_DEPENDS=	textproc/gspell \
		x11/xfce4/libxfce4ui \
		x11/gtksourceview4
CONFIGURE_ARGS =	--enable-gspell

# share/polkit-1/actions/org.xfce.mousepad.policy
BUILD_DEPENDS +=	sysutils/polkit

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 atk-bridge-2.0 c cairo cairo-gobject
WANTLIB += epoxy expat ffi fontconfig freetype fribidi gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 graphite2
WANTLIB += aspell enchant-2 gspell-1 jpeg gtk-3 gtksourceview-4 harfbuzz iconv
WANTLIB += icudata icuuc intl lzma m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8
WANTLIB += pixman-1 png pthread xcb xcb-render xcb-shm
WANTLIB += xml2 z ${COMPILER_LIBCXX}
WANTLIB += Xau Xdmcp execinfo atspi dbus-1
WANTLIB += ICE SM X11-xcb gthread-2.0 startup-notification-1 xcb-util
WANTLIB += xfce4kbd-private-3 xfce4ui-2 xfce4util xfconf-0

.include <bsd.port.mk>
