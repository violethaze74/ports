COMMENT=	Python module providing a password hashing framework

MODPY_EGG_VERSION= 1.7.4
DISTNAME=	passlib-${MODPY_EGG_VERSION}
PKGNAME=	py-passlib-${MODPY_EGG_VERSION}
REVISION=	2

CATEGORIES=	security

HOMEPAGE=	https://bitbucket.org/ecollins/passlib/wiki/Home

# BSD
PERMIT_PACKAGE=	Yes

MODULES=		lang/python
MODPY_PI=		Yes
MODPY_PYBUILD =	setuptools
MODPY_PYTEST_ARGS=	passlib

FLAVORS=	python3
FLAVOR=		python3

RUN_DEPENDS=	security/py-bcrypt${MODPY_FLAVOR} \
		security/py-scrypt${MODPY_FLAVOR}
TEST_DEPENDS=	${RUN_DEPENDS} \
		devel/py-mock${MODPY_FLAVOR} \
		www/apache-httpd

pre-test:
	ln -fs ${LOCALBASE}/bin/htpasswd2 ${WRKDIR}/bin/htpasswd

.include <bsd.port.mk>
