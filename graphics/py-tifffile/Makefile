COMMENT=	read images/metadiff and store numpy arrays in TIFF files

MODPY_EGG_VERSION=	2023.2.28

DISTNAME=	tifffile-${MODPY_EGG_VERSION}
PKGNAME=	py-${DISTNAME}

CATEGORIES=	graphics

HOMEPAGE=	https://github.com/cgohlke/tifffile

# MIT
PERMIT_PACKAGE=	Yes

MODULES=	lang/python
FLAVOR=		python3
FLAVORS=	python3

MODPY_PI=	Yes
MODPY_PYBUILD=	setuptools

RUN_DEPENDS=	math/py-numpy${MODPY_FLAVOR}

# lots of new deps needed
NO_TEST=	Yes

.include <bsd.port.mk>
