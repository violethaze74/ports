COMMENT=	Python library for rich text and beautiful formatting

MODPY_EGG_VERSION=	13.4.2
DISTNAME=	rich-${MODPY_EGG_VERSION}
PKGNAME=	py-rich-${MODPY_EGG_VERSION}

CATEGORIES=	devel

# MIT
PERMIT_PACKAGE=	Yes

MODULES=	lang/python

MODPY_PI=	Yes

FLAVORS=	python3
FLAVOR=		python3

MODPY_PYBUILD=	poetry-core
NO_TEST=	Yes

RUN_DEPENDS=	textproc/py-markdown-it${MODPY_FLAVOR} \
		textproc/py-pygments${MODPY_FLAVOR}

.include <bsd.port.mk>
