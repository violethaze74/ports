# WARNING: this port does NOT use the x11/gnustep MODULE

COMMENT=	GNUstep makefile package

CATEGORIES=	devel x11/gnustep
GH_TAGNAME=	2.9.1
GH_ACCOUNT=	gnustep
GH_PROJECT=	tools-make
DISTNAME=	gnustep-make-${GH_TAGNAME}
HOMEPAGE=	http://www.gnustep.org/

WANTLIB=	${COMPILER_LIBCXX}
MASTER_SITES= 	https://github.com/gnustep/tools-make/releases/download/make-2_9_1/

BUILD_DEPENDS =	x11/gnustep/libobjc2
RUN_DEPENDS=	archivers/gtar

COMPILER =	base-clang

USE_GMAKE=	Yes
MAKE_FILE=	GNUmakefile

WRKDIST=	${WRKDIR}/${DISTNAME}

CONFIGURE_STYLE=gnu
CONFIGURE_ENV =	ac_cv_prog_LATEX2HTML="" \
		INSTALL="install -c" \
		INSTALL_PROGRAM="install -c -m 555" \
		INSTALL_DATA="install -c -m 444" \
		CPPFLAGS='-I${LOCALBASE}/include/gnustep'
CONFIGURE_ARGS=	--with-layout=openbsd \
		--prefix=${PREFIX} \
		--with-config-file=${SYSCONFDIR}/GNUstep.conf \
		--with-tar=${LOCALBASE}/bin/gtar \
		--enable-multi-platform \
		--with-library-combo="${LIBRARY_COMBO}" \
		--with-objc-lib-flag=-lobjc2 \
		--enable-strict-v2-mode

#		--with-runtime-abi=gnustep-2.0

.if ${MACHINE_ARCH} == "amd64" || ${MACHINE_ARCH} == "i386"
LIBRARY_COMBO =		"ng-gnu-gnu"
CONFIGURE_ENV +=	GS_WITH_ARC=1 AS=llvm-as
.else
LIBRARY_COMBO =		"gnu-gnu-gnu"
.endif

pre-configure:
	${SUBST_CMD} -c -m 444 ${FILESDIR}/openbsd \
		${WRKSRC}/FilesystemLayouts/openbsd

post-install:
	${INSTALL_DATA} ${WRKSRC}/{GNUstep.conf,installation-domains.conf} \
		${PREFIX}/share/GNUstep/

.include <bsd.port.mk>
