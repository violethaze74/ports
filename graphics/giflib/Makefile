COMMENT=	tools and library routines for working with GIF images

DISTNAME=	giflib-5.2.1
SHARED_LIBS +=	gif                  9.0      # 7.1
CATEGORIES=	graphics

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=giflib/}

HOMEPAGE=	http://giflib.sourceforge.net/

# MIT
PERMIT_PACKAGE=	Yes

WANTLIB += c m

USE_GMAKE=	Yes
CFLAGS+=	-DHAVE_REALLOCARRAY
MAKE_FLAGS=	CC="${CC}" OFLAGS="${CFLAGS}" LIBVER="${LIBgif_VERSION}"
FAKE_FLAGS=	MANDIR="${PREFIX}/man" LIBVER="${LIBgif_VERSION}"

BUILD_DEPENDS+=	textproc/xmlto
TEST_DEPENDS=	sysutils/coreutils
TEST_TARGET=	check

.include <bsd.port.mk>
