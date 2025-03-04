COMMENT =	neo simple X Image Viewer

GH_PROJECT =	nsxiv
GH_ACCOUNT =	nsxiv
GH_TAGNAME =	v31
REVISION =	0

CATEGORIES =	graphics x11

HOMEPAGE =	https://nsxiv.codeberg.page/

MAINTAINER =	Thim Cederlund <thim@cederlund.de>

# GPLv2+
PERMIT_PACKAGE =	Yes

WANTLIB += Imlib2 X11 Xft c exif fontconfig gif lib/inotify/inotify
WANTLIB += webp webpdemux

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+4,-guic

LIB_DEPENDS =	devel/libinotify \
		graphics/imlib2 \
		graphics/libexif \
		graphics/libwebp

CFLAGS +=	-I${X11BASE}/include \
		-I${X11BASE}/include/freetype2 \
		-I${LOCALBASE}/include \
		-I${LOCALBASE}/include/inotify

LDFLAGS +=	-L${X11BASE}/lib \
		-L${X11BASE}/lib/freetype2 \
		-L${LOCALBASE}/lib \
		-L${LOCALBASE}/lib/inotify \
		-linotify -Wl,-rpath ${LOCALBASE}/lib/inotify \
		-lwebp

MAKE_FLAGS =	CC="${CC}" \
		V=1 \
		PREFIX=${PREFIX} \
		MANPREFIX=${PREFIX}/man \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}"

FAKE_TARGET =	install-all
NO_TEST =	Yes

post-patch:
	${SUBST_CMD} ${WRKSRC}/etc/nsxiv.1

# Git errors break version.h build; this makes it fall back to a
# hardcoded value
pre-build:
	ln -sf /usr/bin/true ${WRKDIR}/bin/git

post-install:
	cd ${PREFIX}/bin && ln -s nsxiv sxiv

.include <bsd.port.mk>
