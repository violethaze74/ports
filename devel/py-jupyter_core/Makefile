COMMENT =		Jupyter core package

MODPY_EGG_VERSION =	4.6.3
DISTNAME =		jupyter_core-${MODPY_EGG_VERSION}
PKGNAME =		py-${DISTNAME}
REVISION =		4

CATEGORIES =		devel

HOMEPAGE =		https://jupyter.org/

# BSD
PERMIT_PACKAGE =	Yes

MODULES =		lang/python
MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools
MODPY_PYTEST_ARGS =	jupyter_core

RUN_DEPENDS =		devel/py-traitlets${MODPY_FLAVOR}
TEST_DEPENDS =		devel/py-ipykernel${MODPY_FLAVOR} \
			devel/py-nose$(MODPY_FLAVOR)

FLAVORS =		python3
FLAVOR =		python3

PORTHOME =		${WRKDIR}

.include <bsd.port.mk>
