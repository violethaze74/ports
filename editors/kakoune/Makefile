COMMENT =		modal code editor with a focus on interactivity

V =			2022.10.31
DISTNAME =		kakoune-${V}
REVISION =		0

CATEGORIES =		editors

HOMEPAGE =		https://kakoune.org/

WANTLIB =		${COMPILER_LIBCXX} c m

MASTER_SITES =		https://github.com/mawww/kakoune/releases/download/v${V}/

EXTRACT_SUFX =		.tar.bz2

# Public domain
PERMIT_PACKAGE =	Yes

# -std=c++17
COMPILER =		base-clang ports-gcc
MAKE_ENV =		CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" gzip_man=no
FAKE_FLAGS =		PREFIX="${TRUEPREFIX}"
# some tests fail without en_US.UTF-8
TEST_ENV =		LC_CTYPE="en_US.UTF-8"

USE_GMAKE =		Yes

.include <bsd.port.mk>
