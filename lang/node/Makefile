ONLY_FOR_ARCHS =	amd64 aarch64 i386 powerpc64 riscv64
DPB_PROPERTIES =	parallel

USE_WXNEEDED =		Yes

COMMENT = JavaScript runtime built on Chrome's V8 JavaScript engine

NODE_VERSION =		v18.16.1
PLEDGE_VER =		1.1.3
DISTFILES =		node-pledge-{}${PLEDGE_VER}.tar.gz:0 \
			${DISTNAME}-headers.tar.gz \
			${DISTNAME}.tar.xz

DISTNAME =		node-${NODE_VERSION}
PKGNAME =		${DISTNAME:S/v//g}

EPOCH =			0

MASTER_SITES0 =		https://github.com/qbit/node-pledge/archive/

CATEGORIES =		lang devel

HOMEPAGE =		https://nodejs.org/
MAINTAINER =		Volker Schlecht <openbsd-ports@schlecht.dev>

# MIT
PERMIT_PACKAGE =	Yes

MASTER_SITES =		${HOMEPAGE}dist/${NODE_VERSION}/

MODULES =		lang/python

WANTLIB += c execinfo m pthread ${COMPILER_LIBCXX}
WANTLIB += z brotlienc brotlidec
WANTLIB += icudata icui18n icuuc cares nghttp2 uv
WANTLIB += lib/eopenssl30/ssl lib/eopenssl30/crypto

COMPILER =		base-clang ports-gcc

USE_GMAKE =		Yes

CXXFLAGS +=		-I${WRKSRC}/deps/googletest/include
MAKE_ENV +=		CXXFLAGS="${CXXFLAGS}"

BUILD_DEPENDS =		sysutils/flock

RUN_DEPENDS =		devel/gmake \
			sysutils/flock

# Needed to build js_native_api_v8_internals.h
TEST_DEPENDS =		devel/gtest

TEST_TARGET =		test-only
CONFIGURE_STYLE =	simple
CONFIGURE_SCRIPT =	configure

CONFIGURE_ARGS =	--prefix=${PREFIX} \
			--with-intl=system-icu \
			--shared-brotli \
			--shared-cares \
			--shared-libuv \
			--shared-nghttp2 \
			--shared-zlib \
			--shared-openssl \
			--shared-openssl-libpath=${EOPENSSL_LIB} \
			--shared-openssl-includes=${EOPENSSL_INC}

SUBST_VARS +=		DISTNAME
SUBST_VARS +=		WRKDIST
SUBST_VARS +=		NODE_VERSION
SUBST_VARS +=		EOPENSSL_LIB

# uses a wide range of OpenSSL API and only really supports boring/openssl
LIB_DEPENDS +=		archivers/brotli \
			devel/libuv \
			net/libcares \
			textproc/icu4c \
			www/nghttp2 \
			security/openssl/3.0

EOPENSSL_LIB =		${LOCALBASE}/lib/eopenssl30
EOPENSSL_INC =		${LOCALBASE}/include/eopenssl30

post-extract:
	mv ${WRKDIR}/node-pledge-${PLEDGE_VER} \
		${WRKSRC}/deps/npm/node_modules/node-pledge

pre-configure:
	${SUBST_CMD} ${WRKDIST}/common.gypi \
		${WRKDIST}/deps/npm/node_modules/node-gyp/lib/install.js \
		${WRKDIST}/src/env.cc \
		${WRKDIST}/tools/test.py

post-install:
	${MODPY_BIN} ${MODPY_LIBDIR}/compileall.py \
		${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp
	${MODPY_BIN} ${MODPY_LIBDIR}/compileall.py \
		${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/update-gyp.py
	${INSTALL_DATA_DIR} ${PREFIX}/share/node
	${INSTALL_DATA} ${FULLDISTDIR}/${DISTNAME}-headers.tar.gz \
		${PREFIX}/share/node/${DISTNAME}-headers.tar.gz
	ln -fs ${TRUEPREFIX}/lib/node_modules/npm/bin/node-gyp-bin/node-gyp \
		${PREFIX}/bin/node-gyp;
	rm -r ${PREFIX}/lib/node_modules/npm/node_modules/node-pledge/build/node_gyp_bins
	cd ${PREFIX}/lib/node_modules/npm/node_modules && for x in *; do \
		mv $$x ../..; \
		ln -s ../../$$x $$x; \
	done

# Includes a lot of networking tests that will fail when running as _pbuild
do-test:
	cd ${WRKSRC} && \
	export HOME=${WRKSRC} && \
	ulimit -n $$(ulimit -Hn) && \
	ulimit -d $$(ulimit -Hd) && \
	${MAKE_PROGRAM} ${TEST_TARGET}

.include <bsd.port.mk>
