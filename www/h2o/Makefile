COMMENT =	optimized HTTP server with support for HTTP/1.x and HTTP/2

SHARED_LIBS +=  h2o-evloop           0.0
SHARED_LIBS +=  h2o                  0.0

CATEGORIES =	www

GH_ACCOUNT =	h2o
GH_PROJECT =	h2o
GH_TAGNAME =	v2.2.6
REVISION =	8

HOMEPAGE =	https://h2o.examp1e.net/
MAINTAINER =	Otto Moerbeek <otto@drijf.net>

# various dep's bundled, all seem to be MIT
PERMIT_PACKAGE =	Yes

WANTLIB += ${COMPILER_LIBCXX} c crypto m ssl uv z

# uses TLS
COMPILER =		base-clang ports-gcc

MODULES =		devel/cmake

BUILD_DEPENDS =		devel/bison
LIB_DEPENDS =		devel/libuv

CONFIGURE_ARGS =	-DBUILD_SHARED_LIBS=ON \
			-DCMAKE_INSTALL_SYSCONFDIR=${SYSCONFDIR}/h2o \
			-DWITH_BUNDLED_SSL=OFF \
			-DWITH_PICOTLS=OFF

post-install:
	cd ${WRKSRC}/doc; pax -rw [a-z]* ${PREFIX}/share/doc/h2o/
	mv ${PREFIX}/share/doc/h2o/examples ${PREFIX}/share/examples/h2o
	${INSTALL_DATA} ${FILESDIR}/h2o.conf ${PREFIX}/share/examples/h2o/

.include <bsd.port.mk>
