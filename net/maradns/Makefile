COMMENT=	simple and performant DNS server

VERSION=	1.3.07.15
DISTNAME=	maradns-${VERSION}
CATEGORIES=	net
REVISION =	2

HOMEPAGE=	http://www.maradns.org/

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB=	c pthread

MASTER_SITES=	http://maradns.org/download/1.3/

MAKE_FLAGS=	CC="${CC}" FLAGS="${CFLAGS} -D_THREAD_SAFE -pthread"

NO_TEST=	Yes

post-configure:
	@find ${WRKSRC} -type f -exec perl -pi -e "s,/etc,${SYSCONFDIR},g" {} +
	@perl -pi -e "s, = 99, = 537," ${WRKSRC}/doc/en/examples/ex*

post-install:
	@chmod a+r ${PREFIX}/share/doc/maradns/source/maraconf.ej
	@mv ${PREFIX}/share/doc/maradns/examples \
		${PREFIX}/share/examples/maradns

.include <bsd.port.mk>
