PORTROACH=	limit:^2\.

COMMENT=	C routines for computing the Discrete Fourier Transform

DISTNAME=	fftw-2.1.5
REVISION=	4
SHARED_LIBS=	fftw	2.7 \
		rfftw	2.7
CATEGORIES=	math

HOMEPAGE=	https://www.fftw.org/

# GPL
PERMIT_PACKAGE=	Yes
WANTLIB=		m

MASTER_SITES=	https://fftw.org/ \
		ftp://ftp.fftw.org/pub/fftw/ \
		ftp://ftp.fftw.org/pub/fftw/old/


CONFIGURE_STYLE=	gnu

.if ${MACHINE_ARCH} == "i386"
CONFIGURE_ARGS+=	--enable-i386-hacks
PATCH_LIST=		gcc-* patch-*
.endif

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/fftw
	${INSTALL_DATA} ${WRKSRC}/doc/fftw.ps ${PREFIX}/share/doc/fftw

.include <bsd.port.mk>
