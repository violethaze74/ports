COMMENT=		RDF Parser Toolkit for Redland
DISTNAME=		raptor2-2.0.16
PKGNAME=		${DISTNAME:C/raptor2/raptor/}
CATEGORIES=		textproc
REVISION=		0

SHARED_LIBS +=  raptor2              0.1      # 0.0

HOMEPAGE=		https://librdf.org/

MASTER_SITES=		https://download.librdf.org/source/

# LGPL 2.1+, GPL 2+ or Apache 2+
PERMIT_PACKAGE=	Yes

WANTLIB += ${COMPILER_LIBCXX} c crypto curl iconv icudata icuuc
WANTLIB += lzma m nghttp2 nghttp3 ngtcp2 ngtcp2_crypto_openssl
WANTLIB += ssl xml2 xslt yajl z

LIB_DEPENDS=		devel/libyajl \
			net/curl \
			textproc/libxslt \
			textproc/icu4c

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--enable-parsers=all \
			--with-www=curl

.include <bsd.port.mk>
