COMMENT=	scanner frontend for SANE

DISTNAME=	xsane-0.999
REVISION=	7

CATEGORIES=	graphics

MASTER_SITES=	http://www.xsane.org/download/

HOMEPAGE=	http://www.xsane.org/

FIX_EXTRACT_PERMISSIONS=Yes

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 c cairo fontconfig freetype
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gobject-2.0
WANTLIB += gtk-x11-2.0 intl jpeg lcms m pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += png sane tiff z harfbuzz

LIB_DEPENDS=	x11/gtk+2 \
		graphics/lcms \
		graphics/sane-backends

RUN_DEPENDS=	devel/desktop-file-utils \
		devel/xdg-utils

USE_GMAKE=	Yes
CONFIGURE_STYLE=gnu

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

NO_TEST=	Yes

FLAVORS=	gimp
FLAVOR?=

.if ${FLAVOR} == "gimp"
WANTLIB += gimp-2.0 gimpbase-2.0 gimpcolor-2.0 gimpconfig-2.0
WANTLIB += gimpmath-2.0 gimpmodule-2.0 gimpui-2.0 gimpwidgets-2.0
WANTLIB += babl-0.1 gegl-0.4 gmodule-2.0 json-glib-1.0 pthread
LIB_DEPENDS +=graphics/gimp/stable
CONFIGURE_ENV += CPPFLAGS+="-I${LOCALBASE}/include/gimp-2.0"
.else
CONFIGURE_ARGS+=--disable-gimp
.endif

MAKE_FLAGS=	localedir=${TRUEPREFIX}/share/locale \
		sanedatadir=${TRUEPREFIX}/share/ \
		xsanedocdir=${TRUEPREFIX}/share/doc/xsane/

.include <bsd.port.mk>
