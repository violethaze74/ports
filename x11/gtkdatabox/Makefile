COMMENT =	GTK+2 widget to display large amounts of numerical data

DISTNAME =	gtkdatabox-0.9.1.1
REVISION =	12

SHARED_LIBS =	gtkdatabox 0.0

CATEGORIES =	x11

HOMEPAGE =	http://www.eudoxos.de/gtk/gtkdatabox/

MAINTAINER =	Pierre-Emmanuel Andre <pea@openbsd.org>

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama Xrandr
WANTLIB += Xrender atk-1.0 cairo expat ffi fontconfig freetype fribidi
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 graphite2 gthread-2.0 gtk-x11-2.0 harfbuzz iconv
WANTLIB += intl m pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre2-8 pixman-1
WANTLIB += png pthread xcb xcb-render xcb-shm z ${COMPILER_LIBCXX}
WANTLIB += Xau Xdmcp jpeg

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=gtkdatabox/}

LIB_DEPENDS =	x11/gtk+2



CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
