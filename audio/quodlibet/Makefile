COMMENT=	audio player and tagger for GTK+ with regex support

MODPY_EGG_VERSION= 4.5.0
REVISION=	3
DISTNAME=	quodlibet-${MODPY_EGG_VERSION}
PORTROACH=	skipv:release-${MODPY_EGG_VERSION}

CATEGORIES=	audio

HOMEPAGE=	https://quodlibet.readthedocs.org/

# GPLv2+
PERMIT_PACKAGE=	Yes

MASTER_SITES=	https://github.com/quodlibet/quodlibet/releases/download/release-${MODPY_EGG_VERSION}/

MODULES=	lang/python

RUN_DEPENDS=	audio/py-musicbrainzngs${MODPY_FLAVOR} \
		audio/py-mutagen${MODPY_FLAVOR} \
		devel/py-gobject3${MODPY_FLAVOR} \
		graphics/py-cairo${MODPY_FLAVOR} \
		textproc/py-feedparser${MODPY_FLAVOR} \
		x11/dbus-python${MODPY_FLAVOR}

# others
RUN_DEPENDS+=	devel/desktop-file-utils \
		devel/libsoup3 \
		multimedia/gstreamer1/plugins-good>=1.20.3p0 \
		multimedia/gstreamer1/plugins-libav \
		multimedia/xine-lib \
		x11/gtk+4,-guic

BUILD_DEPENDS=	${RUN_DEPENDS} \
		devel/gettext,-runtime \
		devel/gettext,-tools
MODPY_ADJ_FILES= *py

MODPY_DISTUTILS_INSTALLARGS= --mandir=${PREFIX}/man

do-test:
	cd ${WRKSRC}; ${MODPY_BIN} ./setup.py test

.include <bsd.port.mk>
