COMMENT =	text based gopher client
DISTNAME =	clic-v1.1.5
REVISION =	0
PKGNAME =	${DISTNAME:S/-v/-/}
EXTRACT_SUFX =	.tgz
CATEGORIES =	net

HOMEPAGE =	gopher://bitreich.org/1/scm/clic

# 2-Clause BSD
PERMIT_PACKAGE =	Yes

# uses pledge()
WANTLIB += c ecl ffi gc gmp m pthread

MASTER_SITES =	ftp://bitreich.org/releases/clic/

LIB_DEPENDS =	lang/ecl

# To open HTML and other links clic doesn't understand.
RUN_DEPENDS =	devel/xdg-utils

NO_TEST =	Yes
PORTHOME=	${WRKDIST}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/clic ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/clic.1 ${PREFIX}/man/man1/clic.1

.include <bsd.port.mk>
