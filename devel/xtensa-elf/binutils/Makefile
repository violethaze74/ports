COMMENT=	binutils for xtensa-elf cross-development

V=		2.27
DISTNAME=	binutils-$V
REVISION=	1

HOMEPAGE=	https://www.gnu.org/software/binutils/

WANTLIB=	c

MASTER_SITES=	${MASTER_SITE_GNU:=binutils/}
DIST_SUBDIR=	binutils

USE_LIBTOOL=	No

CONFIGURE_ARGS+=--enable-commonbfdlib=no \
		--enable-interwork	 \
		--enable-multilib

.include <bsd.port.mk>
