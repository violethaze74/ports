COMMENT=		Joe's Window Manager

V=			2.4.3
DISTNAME=		jwm-${V}

CATEGORIES=		x11

HOMEPAGE=		https://www.joewing.net/projects/jwm/

# MIT
PERMIT_PACKAGE=	Yes

WANTLIB += X11 Xext Xft Xinerama Xmu Xpm Xrender c cairo fontconfig
WANTLIB += freetype gdk_pixbuf-2.0 gio-2.0 glib-2.0 gobject-2.0
WANTLIB += harfbuzz iconv intl jpeg m pango-1.0 pangoft2-1.0 pangoxft-1.0
WANTLIB += png rsvg-2

MASTER_SITES=		https://github.com/joewing/jwm/releases/download/v${V}/
EXTRACT_SUFX=		.tar.xz
DEBUG_PACKAGES=		${BUILD_PACKAGES}

BUILD_DEPENDS=		devel/gettext,-tools

LIB_DEPENDS=		devel/glib2 \
			x11/gnome/librsvg

NO_TEST=		Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/jwm ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/jwm.1 ${PREFIX}/man/man1
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/jwm
	${INSTALL_DATA} ${WRKSRC}/example.jwmrc \
		${PREFIX}/share/examples/jwm/system.jwmrc

.include <bsd.port.mk>
