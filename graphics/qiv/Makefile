COMMENT=		very small and pretty fast gdk/Imlib image viewer

DISTNAME=		qiv-2.3.2
REVISION=		0
CATEGORIES=		graphics

EXTRACT_SUFX=		.tgz

HOMEPAGE=		https://spiegl.de/qiv/

MASTER_SITES=		${HOMEPAGE}/download/

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += Imlib2 X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender c cairo exif fontconfig freetype
WANTLIB += gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glib-2.0 gobject-2.0
WANTLIB += harfbuzz intl jpeg lcms2 magic pango-1.0 pangocairo-1.0
WANTLIB += tiff

LIB_DEPENDS=		devel/libmagic \
			graphics/imlib2 \
			graphics/lcms2 \
			graphics/libexif \
			x11/gtk+2

USE_GMAKE=		Yes
NO_TEST=		Yes

post-configure:
	${SUBST_CMD} ${WRKSRC}/qiv.1
	sed -i 's,bash,sh,' ${WRKSRC}/contrib/qiv-command.example

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/qiv/
	${INSTALL_DATA} ${WRKSRC}/contrib/qiv-command.example \
		${PREFIX}/share/examples/qiv/

.include <bsd.port.mk>
