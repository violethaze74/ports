COMMENT =		reusable state for writing clean Python tests

MODPY_EGG_VERSION =	3.0.0

DISTNAME =		fixtures-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}
REVISION =		5

CATEGORIES =		devel

HOMEPAGE =		https://launchpad.net/python-fixtures

MAINTAINER =		Pamela Mosiejczuk <pamela@openbsd.org>

# Apache 2.0 or 3-Clause BSD
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools
MODPY_PYTEST_ARGS =	fixtures

FLAVORS =		python3
FLAVOR =		python3

BUILD_DEPENDS =		devel/py-pbr${MODPY_FLAVOR}

RUN_DEPENDS =		devel/py-six${MODPY_FLAVOR} \
			devel/py-testtools${MODPY_FLAVOR}

TEST_DEPENDS =		devel/py-mock${MODPY_FLAVOR}

.include <bsd.port.mk>
