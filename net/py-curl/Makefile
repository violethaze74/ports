COMMENT=	Python interface to cURL library

MODPY_EGG_VERSION=	7.45.2
DISTNAME=	pycurl-${MODPY_EGG_VERSION}
PKGNAME=	py-curl-${MODPY_EGG_VERSION}
CATEGORIES=	net

HOMEPAGE=	http://pycurl.io/

# dual: LGPL or MIT-like
PERMIT_PACKAGE=	Yes

WANTLIB += ${MODPY_WANTLIB}
WANTLIB += crypto curl nghttp2 pthread ssl z

MODULES=	lang/python

MODPY_PI=	Yes
MODPY_PYBUILD=	setuptools

FLAVORS=	python3
FLAVOR=		python3

LIB_DEPENDS=	net/curl

SUBST_VARS+=	MODPY_PY_PREFIX

MODPY_PYTEST_ARGS=	tests

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples
	mv ${PREFIX}/share/doc/pycurl/examples \
		${PREFIX}/share/examples/${MODPY_PY_PREFIX}curl/
	mv ${PREFIX}/share/doc/pycurl \
		${PREFIX}/share/doc/${MODPY_PY_PREFIX}curl/

TEST_DEPENDS=	${BUILD_PKGPATH} \
		devel/py-flaky${MODPY_FLAVOR} \
		devel/py-nose${MODPY_FLAVOR} \
		www/py-bottle${MODPY_FLAVOR}

.include <bsd.port.mk>
