COMMENT =	Python interface to memcached

MODPY_EGG_VERSION = 1.59
DISTNAME =	python-memcached-${MODPY_EGG_VERSION}
PKGNAME =	${DISTNAME:S/python-/py-/}
CATEGORIES =	misc
REVISION =	2

HOMEPAGE =	https://github.com/linsomniac/python-memcached

# Python
PERMIT_PACKAGE =	Yes

FLAVORS =	python3
FLAVOR =	python3

MODULES =	lang/python

MODPY_ADJ_FILES =	memcache.py
MODPY_PYBUILD =	setuptools
MODPY_PI =	Yes

NO_TEST =	Yes

BUILD_DEPENDS =	devel/py-six${MODPY_FLAVOR}
RUN_DEPENDS =	devel/py-six${MODPY_FLAVOR}

.include <bsd.port.mk>
