COMMENT =		matrices describing affine transformation of the plane

MODPY_EGG_VERSION =	2.4.0
DISTNAME =		affine-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}
CATEGORIES =		math

MAINTAINER =		Martin Reindl <martin@catai.org>

# BSD
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =	setuptools

BUILD_DEPENDS +=	devel/py-flit_core${MODPY_FLAVOR}

TEST_DEPENDS =		devel/py-test-cov${MODPY_FLAVOR}

FLAVORS =		python3
FLAVOR =		python3

.include <bsd.port.mk>
