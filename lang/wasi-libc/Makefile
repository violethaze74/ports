COMMENT =	C standard library for WebAssembly System Interface

GH_ACCOUNT =	WebAssembly
GH_PROJECT =	wasi-libc
GH_COMMIT =	05cd0af0af4b5a191117d47a182adff1d6546b87
DISTNAME =	wasi-libc-0.20220413

CATEGORIES =	lang

# Apache-2.0 with LLVM Exceptions, Apache-2.0, MIT
PERMIT_PACKAGE =	Yes

COMPILER =	ports-clang
USE_GMAKE =	yes
ALL_TARGET =	finish

MAKE_ENV +=	AR=${LOCALBASE}/bin/llvm-ar \
		NM=${LOCALBASE}/bin/llvm-nm \
		INSTALL_DIR=${WRKINST}${PREFIX}/share/wasi-sysroot

.include <bsd.port.mk>
