ONLY_FOR_ARCHS= i386 amd64

COMMENT=	improved version of afl
GH_ACCOUNT =	AFLplusplus
GH_PROJECT =	AFLplusplus
GH_TAGNAME =	4.05c
PKGNAME =	afl++-${GH_TAGNAME}
CATEGORIES=	devel

HOMEPAGE=	https://aflplus.plus/
MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>

# Apache 2.0
PERMIT_PACKAGE=	Yes

WANTLIB =		${COMPILER_LIBCXX} c m
USE_GMAKE=		Yes

MODULES =		lang/clang

MAKE_FLAGS =		NO_PYTHON=1
FAKE_FLAGS=		PREFIX="${TRUEPREFIX}"
TEST_TARGET=		tests

.include <bsd.port.mk>
