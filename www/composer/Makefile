COMMENT=	dependency manager for PHP

CATEGORIES=	www devel

PORTROACH=	site:https://github.com/composer/composer/archive/

V=		2.5.7
EPOCH=		0
MASTER_SITES=	https://getcomposer.org/download/$V/
DISTNAME=	composer-$V
DISTFILES=	composer-$V{composer}.phar
EXTRACT_SUFX=	.phar
EXTRACT_ONLY=

HOMEPAGE=	https://getcomposer.org/

MODULES=	lang/php

# MIT
PERMIT_PACKAGE=	Yes

NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*

do-extract:
	mkdir ${WRKSRC}; \
	  cp ${FULLDISTDIR}/composer-$V.phar ${WRKSRC}/composer.phar

do-install:
	${INSTALL_DATA} ${WRKSRC}/composer.phar ${PREFIX}/libexec/
	${SUBST_CMD} -m 555 -c ${FILESDIR}/composer ${PREFIX}/bin/composer

.include <bsd.port.mk>
