COMMENT=	recursive DNS resolver

DISTNAME=	deadwood-3.2.14
PKGNAME=	${DISTNAME:S/^/maradns-/}
EXTRACT_SUFX=	.tar.bz2
CATEGORIES=	net
REVISION=	0

HOMEPAGE=	https://maradns.samiam.org/deadwood

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB += c

MASTER_SITES=	${HOMEPAGE}/stable/ \
		${HOMEPAGE}/stable/old/

MAKE_FLAGS=	FLAGS="${CFLAGS} -DIPV6" CC="${CC}"
WRKSRC=		${WRKDIST}/src

NO_TEST=	Yes

do-configure:
	cd ${WRKSRC}; perl -pi -e 's,/etc/,${SYSCONFDIR}/,g' DwMararc.h DwMain.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/Deadwood ${PREFIX}/sbin
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/maradns-deadwood
	cd ${WRKDIST}/doc; \
	    ${INSTALL_MAN} Deadwood.1 ${PREFIX}/man/man1; \
	    ${INSTALL_DATA} dwood3rc ${PREFIX}/share/examples/maradns-deadwood/

.include <bsd.port.mk>
