COMMENT=	proxy/masquerading daemon for the SIP protocol

DISTNAME=	siproxd-0.8.3
CATEGORIES=	telephony net
REVISION=	0

HOMEPAGE=	http://siproxd.sourceforge.net/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2+
PERMIT_PACKAGE=	Yes

WANTLIB=	c ltdl m osip2 osipparser2 pthread sqlite3 z

MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=siproxd/}

USE_LIBTOOL=	gnu
LIBTOOL_FLAGS=	--tag=disable-static

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--with-extra-includes=${LOCALBASE}/include \
		--with-extra-libs=${LOCALBASE}/lib
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/scripts

LIB_DEPENDS=	databases/sqlite3 \
		devel/libtool,-ltdl \
		telephony/libosip2

DOCDIR=		${PREFIX}/share/doc/siproxd
EXDIR=		${PREFIX}/share/examples/siproxd
SUBST_VARS=	PREFIX

pre-build:
	${SUBST_CMD} ${WRKSRC}/doc/siproxd.conf.example

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/FAQ ${DOCDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/KNOWN_BUGS ${DOCDIR}
	${INSTALL_DATA_DIR} ${EXDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/siproxd.conf.example ${EXDIR}
	${INSTALL_DATA} ${WRKDIST}/doc/siproxd_passwd.cfg ${EXDIR}
	rm ${PREFIX}/lib/siproxd/plugin_*.la

.include <bsd.port.mk>
