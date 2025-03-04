BROKEN-alpha=	ICE in cupsfilters/image-jpeg.c:316
BROKEN-hppa=	ICE on filter/pdftopdf/qpdf_pdftopdf.cc:147

COMMENT=	OpenPrinting CUPS filters

V=		1.28.17
DISTNAME=	cups-filters-${V}
REVISION=	0

CATEGORIES=	print

SHARED_LIBS +=  cupsfilters          1.2      # 1.0
SHARED_LIBS +=  fontembed            1.0      # 1.0

HOMEPAGE=	https://wiki.linuxfoundation.org/openprinting/cups-filters

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3 - LGPLv2 - GPLv2+ - MIT
PERMIT_PACKAGE=	Yes

WANTLIB += ${COMPILER_LIBCXX} avahi-client avahi-common avahi-glib
WANTLIB += brotlidec brotlienc c crypto cups dbus-1 execinfo exif
WANTLIB += expat ffi fontconfig freetype gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gmp gnutls gobject-2.0 hogweed iconv idn2 intl jpeg
WANTLIB += lcms2 lzma m nettle openjp2 p11-kit pcre2-8 png poppler
WANTLIB += poppler-cpp qpdf ssl tasn1 tiff unistring z zstd

MASTER_SITES=	https://github.com/OpenPrinting/cups-filters/releases/download/${V}/

# cc1plus: error: unrecognized command line option "-std=c++0x"
COMPILER=	base-clang ports-gcc

USE_GMAKE=	Yes

.if ${MACHINE_ARCH} == "hppa"
CFLAGS +=	-O0
.endif

# default is: --with-pdftops=hybrid (pdftops+gs)
BUILD_DEPENDS=	print/ghostscript/gnu \
		print/poppler,-utils
RUN_DEPENDS=	print/ghostscript/gnu \
		print/poppler,-utils

LIB_DEPENDS=	graphics/libexif \
		net/avahi,-glib \
		print/cups,-libs \
		print/poppler \
		print/qpdf

# make it easier for users: bring in foomatic-db and allow the
# regeneration of PPD files from share/foomatic/db/source/*/*.xml
RUN_DEPENDS +=	print/foomatic-db-engine

# don't enforce dependency on colord; it'll be used if found at runtime
#RUN_DEPENDS +=	graphics/colord

FAKE_FLAGS=	pkgfontconfigdir=${PREFIX}/share/examples/cups-filters \
		pkgcupsserverrootdir=${PREFIX}/share/examples/cups-filters/cups

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include" \
		LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib"

CONFIGURE_ARGS=	--with-gs-path=${LOCALBASE}/bin/gs \
		--with-test-font-path=${X11BASE}/lib/X11/fonts/TTF/DejaVuSans.ttf \
		--with-shell=/bin/ksh \
		--without-php \
		--with-pdftops-path=${LOCALBASE}/bin/pdftops \
		--disable-braille \
		--disable-mutool

FLAVORS=	ldap
FLAVOR?=

.if ${FLAVOR:Mldap}
WANTLIB += lber ldap sasl2
LIB_DEPENDS +=		databases/openldap
.else
CONFIGURE_ARGS +=	--disable-ldap
.endif

DEBUG_PACKAGES=		${BUILD_PACKAGES}

pre-configure:
	sed -i -e 's,/usr/share/cups,${LOCALBASE}/share/cups,g;' \
		-e 's,/usr/bin,${LOCALBASE}/bin,g' \
		${WRKSRC}/filter/{gstoraster.c,gstopxl}
	sed -i 's,/etc/cups,${SYSCONFDIR}/cups,g' \
		${WRKSRC}/filter/foomatic-rip/spooler.c
	sed -i 's,/usr/local,${LOCALBASE},g' \
		${WRKSRC}/filter/foomatic-rip/foomaticrip.c

post-install:
	rm -rf ${WRKINST}/rc?.d
# handle old filters looking for these
	cd ${PREFIX}/libexec/cups/filter && ln -s gstopxl pstopxl
	cd ${PREFIX}/libexec/cups/filter && ln -s gstoraster pstoraster

.include <bsd.port.mk>
