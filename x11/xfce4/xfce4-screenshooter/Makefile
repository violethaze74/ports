COMMENT=	Xfce4 desktop screenshot panel plugin

XFCE_VERSION=	1.10.4
XFCE_GOODIE=	xfce4-screenshooter

PORTROACH=	limitw:1,even

# GPLv2
PERMIT_PACKAGE=	Yes

MODULES=	x11/xfce4

LIB_DEPENDS=	x11/xfce4/xfce4-panel \
		devel/libsoup3

# Build picks up help2man automatically
CONFIGURE_ENV +=	ac_cv_prog_HELP2MAN=

MODXFCE_DESKTOP_FILE=	Yes
MODXFCE_ICON_CACHE=	Yes
MODXFCE_PURGE_LA =	lib/xfce4/panel/plugins
MODXFCE_WANTLIB =	xfce4panel-2.0

WANTLIB += ICE SM X11 X11-xcb Xau Xcomposite Xcursor Xdamage Xdmcp
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender fribidi
WANTLIB += atk-1.0 c cairo execinfo expat ffi fontconfig freetype gdk-3
WANTLIB += gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0
WANTLIB += gthread-2.0 gtk-3 m pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 pcre2-8 pixman-1 png pthread
WANTLIB += soup-3.0 startup-notification-1 xcb xcb-util xcb-render
WANTLIB += xcb-shm xfce4panel-2.0 xfce4util xfconf-0 xml2 z
WANTLIB += harfbuzz xfce4ui-2 brotlicommon brotlidec
WANTLIB += graphite2 lzma sqlite3 iconv intl jpeg atspi dbus-1 nghttp2
WANTLIB += atk-bridge-2.0 cairo-gobject epoxy exo-2 idn2 psl unistring
WANTLIB += ${COMPILER_LIBCXX}

.include <bsd.port.mk>
