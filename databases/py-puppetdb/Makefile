COMMENT=		library for working with the PuppetDB API

MODPY_EGG_VERSION=	3.1.0
DISTNAME=		pypuppetdb-${MODPY_EGG_VERSION}
PKGNAME=		py-puppetdb-${MODPY_EGG_VERSION}
CATEGORIES=		databases www

MAINTAINER=		Sebastian Reitenbach <sebastia@openbsd.org>

# Apache2
PERMIT_PACKAGE=	Yes

MODULES=	lang/python

MODPY_PYBUILD=	setuptools
MODPY_PI=	Yes

FLAVORS=	python3
FLAVOR=		python3

RUN_DEPENDS=	www/py-requests${MODPY_FLAVOR}>=2.22.0
BUILD_DEPENDS=	${RUN_DEPENDS}

# ERROR: toxini file 'tox.ini' not found
NO_TEST=	Yes

# The file doesn't exist, but setup tries to open it and fails
pre-build:
	touch ${WRKDIST}/CHANGELOG.md

.include <bsd.port.mk>
