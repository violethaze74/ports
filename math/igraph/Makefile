COMMENT = 	C graph library
V =		0.10.4
DISTNAME =	igraph-$V

SHARED_LIBS =	igraph 2.0	# 0.0

CATEGORIES =	math

HOMEPAGE = 	https://igraph.org/

# GPLv2
PERMIT_PACKAGE =	Yes

WANTLIB += 	${COMPILER_LIBCXX} m
WANTLIB += 	arpack blas cxsparse glpk gmp lapack xml2

MASTER_SITES =	https://github.com/igraph/igraph/releases/download/$V/

COMPILER =	base-clang ports-gcc
MODULES =	devel/cmake

LIB_DEPENDS = 	devel/glpk \
		devel/gmp \
		math/arpack \
		math/blas \
		math/suitesparse \
		textproc/libxml

# cmake will auto-detect flex and bison, but as noted in the documentation
# those are only needed to regenerate parsers in the development version
# The release tarball doesn't even ship those .y/.l files
CONFIGURE_ARGS += 	-DBUILD_SHARED_LIBS=ON \
    			-DIGRAPH_ENABLE_TLS=ON \
			-DIGRAPH_WARNINGS_AS_ERRORS=OFF

.include <bsd.port.arch.mk>
.if ${PROPERTIES:Mlld}
CONFIGURE_ARGS += 	-DIGRAPH_ENABLE_LTO=ON

DEBUG_PACKAGES = 	${BUILD_PACKAGES}
.endif
.include <bsd.port.mk>
