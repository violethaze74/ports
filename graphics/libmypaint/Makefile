COMMENT =	library for making brushstrokes

V =		1.6.1
DISTNAME =	libmypaint-$V
EXTRACT_SUFX =	.tar.xz
REVISION =	1

SHARED_LIBS +=		mypaint-gegl	0.0 # 0.0
SHARED_LIBS +=		mypaint		0.0 # 0.0

CATEGORIES =	graphics

HOMEPAGE =	http://mypaint.org/

# ISC
PERMIT_PACKAGE = Yes

WANTLIB += babl-0.1 ffi gegl-0.4 gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 iconv intl json-c json-glib-1.0 lcms2
WANTLIB += m pcre2-8 pthread z

MASTER_SITES =	https://github.com/mypaint/libmypaint/releases/download/v$V/

MODULES =		textproc/intltool

SEPARATE_BUILD =	Yes
CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

CONFIGURE_STYLE =	gnu
USE_GMAKE =		Yes

BUILD_DEPENDS +=	devel/gobject-introspection

LIB_DEPENDS +=		devel/json-c \
			devel/glib2 \
			graphics/babl \
			graphics/gegl04

RUN_DEPENDS +=		devel/gobject-introspection \
			graphics/mypaint-brushes

CONFIGURE_ARGS +=	--enable-gegl

.include <bsd.port.mk>
