COMMENT=	wiki and bug tracking system for software projects

MODPY_EGG_VERSION=1.5.4
#PORTROACH=	limitw:1,even
DISTNAME=	Trac-${MODPY_EGG_VERSION:S/post/.post/}
PKGNAME=	trac-${MODPY_EGG_VERSION:S/post/pl/}
CATEGORIES=	www devel

MAINTAINER=	Stuart Henderson <stu.ports@spacehopper.org>

HOMEPAGE=	https://trac.edgewall.org/

MASTER_SITES=	https://download.edgewall.org/trac/

MODPY_PYBUILD=	setuptools

# BSD
PERMIT_PACKAGE=   Yes

MODULES=	lang/python

COMMON_DEPS=	devel/py-babel${MODPY_FLAVOR} \
		textproc/py-MarkupSafe${MODPY_FLAVOR} \
		www/py-jinja2${MODPY_FLAVOR}

RUN_DEPENDS=	${COMMON_DEPS} \
		devel/subversion,-python \
		textproc/py-docutils${MODPY_FLAVOR} \
		textproc/py-pygments${MODPY_FLAVOR}

BUILD_DEPENDS=	${COMMON_DEPS}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/trac
	cd ${WRKSRC} && pax -rw contrib/ ${PREFIX}/share/examples/trac

do-test:
	@cd ${WRKSRC} && PYTHONPATH=. ${MODPY_BIN} ./trac/test.py

.include <bsd.port.mk>
