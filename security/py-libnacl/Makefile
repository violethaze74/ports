COMMENT=		Python bindings for libsodium/tweetnacl based on ctypes

MODPY_EGG_VERSION=	1.8.0
DISTNAME=		libnacl-${MODPY_EGG_VERSION}
PKGNAME=		py-${DISTNAME}

CATEGORIES=		security

HOMEPAGE=		https://libnacl.readthedocs.org/en/latest/

MAINTAINER=		Renaud Allard <renaud@allard.it>

# apache 2.0
PERMIT_PACKAGE=	Yes

MODULES=		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools
FLAVORS =		python3
FLAVOR =		python3

RUN_DEPENDS =		security/libsodium

.include <bsd.port.mk>
