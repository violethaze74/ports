COMMENT =		socks proxy for use with tor

DISTNAME =		torsocks-2.3.0

SHARED_LIBS =		torsocks	1.0 # 0.0

CATEGORIES =		net

HOMEPAGE =		https://gitweb.torproject.org/torsocks.git/

MAINTAINER =		Pascal Stumpf <pascal@stumpf.co>

# GPLv2+
PERMIT_PACKAGE =	Yes

WANTLIB += pthread

MASTER_SITES=	https://gitweb.torproject.org/torsocks.git/snapshot/

AUTOCONF_VERSION=	2.69
AUTOMAKE_VERSION=	1.15

BUILD_DEPENDS=		${MODGNU_AUTOCONF_DEPENDS} \
			${MODGNU_AUTOMAKE_DEPENDS}

USE_LIBTOOL =		gnu

RUN_DEPENDS =		net/tor

FAKE_FLAGS =		CONFDIR=${PREFIX}/share/examples/torsocks

CONFIGURE_STYLE =	gnu

pre-patch:
	cd ${WRKSRC} && \
		AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} ./autogen.sh

pre-configure:
	${SUBST_CMD} ${WRKSRC}/src/bin/torsocks.in


.include <bsd.port.mk>
