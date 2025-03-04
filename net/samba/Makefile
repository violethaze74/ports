VERSION =		4.17.7
DISTNAME =		samba-${VERSION}
EPOCH =			0

COMMENT-main =		SMB and CIFS client and server for UNIX
COMMENT-docs =		additional documentation and examples for Samba

PKGNAME-main =		${PKGNAME}
PKGNAME-docs =		samba-docs-${VERSION}

PKG_ARCH-docs =		*

SHARED_LIBS =		dcerpc			1.1 \
			dcerpc-binding		4.0 \
			dcerpc-samr		1.0 \
			dcerpc-server-core	3.0 \
			ldb			2.2 \
			ndr			3.0 \
			ndr-krb5pac		1.1 \
			ndr-nbt			1.0 \
			ndr-standard		4.2 \
			netapi			3.2 \
			samba-credentials	1.2 \
			samba-errors		2.1 \
			samba-hostconfig	11.0 \
			samba-passdb		3.0 \
			samba-util		8.0 \
			samdb			2.1 \
			smbclient		6.1 \
			smbconf			12.2 \
			smbldap			1.0 \
			tevent			2.1 \
			tevent-util		2.0 \
			wbclient		5.0

# Those have to be handled specially, see "Python ABI" below.
SHARED_LIBS +=		pyldb-util.cpython-${MODPY_MAJORMINOR}		1.0
SHARED_LIBS +=		samba-policy.cpython-${MODPY_MAJORMINOR}	1.0

CATEGORIES =		net sysutils security

HOMEPAGE =		https://www.samba.org/

MAINTAINER =		Ian McWilliam <kaosagnt@gmail.com>, \
			Jeremie Courreges-Anglas <jca@wxcvbn.org>

# GPLv3, LGPLv3
PERMIT_PACKAGE =	Yes

WANTLIB-main =		${MODPY_WANTLIB}
WANTLIB-main +=		avahi-client avahi-common cups c execinfo
WANTLIB-main +=		iconv jansson lber ldap pam popt pthread gnutls
WANTLIB-main +=		pytalloc-util.cpython-${MODPY_MAJORMINOR} readline
WANTLIB-main +=		talloc tasn1 tdb z lib/inotify/inotify

WANTLIB-docs =

MASTER_SITES =		https://download.samba.org/pub/samba/stable/ \
			https://download.samba.org/pub/samba/old-versions/

MULTI_PACKAGES =	-main -docs
DEBUG_PACKAGES =	${BUILD_PACKAGES}

COMPILER =		base-clang ports-gcc
COMPILER_LANGS =	c

MODULES =		lang/python perl

BUILD_DEPENDS =		converters/p5-JSON \
			databases/tdb,-python \
			devel/bison \
			devel/cmocka \
			devel/p5-Parse-Yapp>=1.0.5 \
			net/py-dnspython${MODPY_FLAVOR} \
			textproc/docbook-xsl

RUN_DEPENDS-main =	databases/tdb,-python \
			net/py-dnspython${MODPY_FLAVOR}

RUN_DEPENDS-docs =

LIB_DEPENDS-main =	converters/libiconv \
			databases/openldap \
			databases/tdb>=1.4.7 \
			devel/jansson \
			devel/libinotify \
			devel/libtalloc>=2.3.4 \
			devel/libtalloc,-python \
			devel/popt \
			net/avahi,-libs \
			print/cups,-libs \
			security/gnutls \
			security/openpam

LIB_DEPENDS-docs =

CONFIGURE_STYLE =	simple

CONFIGURE_ARGS =	--enable-fhs \
			--abi-check-disable \
			--bundled-libraries="!crypto,ldb,!talloc,!tdb,tevent" \
			--prefix=${PREFIX} \
			--destdir=${WRKINST} \
			--docdir=${PREFIX}/share/doc \
			--mandir=${PREFIX}/man \
			--localedir=${PREFIX}/share/locale \
			--localstatedir=${BASELOCALSTATEDIR} \
			--private-libraries="NONE" \
			--sharedstatedir=${VARBASE} \
			--sysconfdir=${SYSCONFDIR} \
			--with-configdir=${SYSCONFDIR}/samba \
			--with-statedir=${VARBASE}/samba \
			--with-privatedir=${VARBASE}/samba/private \
			--with-bind-dns-dir=${VARBASE}/samba/bind-dns \
			--with-lockdir=${VARBASE}/run/samba \
			--with-privileged-socket-dir=${VARBASE}/samba \
			--without-pie \
			--pedantic \
			--without-regedit \
			--without-acl-support \
			--without-libarchive \
			--disable-rpath \
			--without-ad-dc \
			--without-gpgme \
			--without-ldb-lmdb \
			--without-fam
# hack for https://bugzilla.samba.org/show_bug.cgi?id=15030
CONFIGURE_ARGS +=	--without-gettext

# XXX Remember to remove --enable-developer, it prints passwords in logs.
#CONFIGURE_ARGS +=	--enable-developer

WAF =			${WRKSRC}/buildtools/bin/waf
WAF_ARGS =		-v -j ${MAKE_JOBS}

CONFIGURE_ENV =		LC_ALL=en_US.UTF-8 \
			CFLAGS="${CFLAGS}" \
			LDFLAGS="${LDFLAGS}" \
			CPP="/usr/libexec/cpp" \
			CPPFLAGS="-I${LOCALBASE}/include/inotify -I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib/inotify -Wl,-rpath,${LOCALBASE}/lib/inotify -L${LOCALBASE}/lib ${LDFLAGS}"

MAKE_ENV =		LC_ALL=en_US.UTF-8 \
			PYTHON=${MODPY_BIN} \
			WAF_ARGS="${WAF_ARGS}"

.for _l _v in ${SHARED_LIBS}
MAKE_ENV +=		LIB${_l:S/-/_/g}_VERSION=${_v}
.endfor

## Python ABI
# The samba project decided to also encode the python ABI name into shared
# libraries that link against libpython.  Our ports infrastructure barely
# copes.

# 1. Those shared libraries names contain a variable whose value is not yet
# known by the time the .for loop runs
MAKE_ENV +=		LIBpyldb_util_cpython_${MODPY_MAJORMINOR}_VERSION=${LIBpyldb-util.cpython-${MODPY_MAJORMINOR}_VERSION}
MAKE_ENV +=		LIBsamba_policy_cpython_${MODPY_MAJORMINOR}_VERSION=${LIBsamba-policy.cpython-${MODPY_MAJORMINOR}_VERSION}

# 2. Said libraries end up as such in pkg/PLIST-foo:
# @lib lib/libbar.${MODPY_PYC_MAGIC_TAG}so.${LIBbar.cpython-XY_VERSION}
# We don't want to hardcode the XY version number in the PLIST.
PYLDB_UTIL_LIBSUFFIX =	cpython-${MODPY_MAJORMINOR}.so.${LIBpyldb-util.cpython-${MODPY_MAJORMINOR}_VERSION}
SUBST_VARS +=		PYLDB_UTIL_LIBSUFFIX
SAMBA_POLICY_LIBSUFFIX=	cpython-${MODPY_MAJORMINOR}.so.${LIBsamba-policy.cpython-${MODPY_MAJORMINOR}_VERSION}
SUBST_VARS +=		SAMBA_POLICY_LIBSUFFIX

# 3. Some samba python extension modules don't follow the same naming
# pattern as the usual python extension modules.
SAMBA_PYTHON_MAGIC_TAG=	${MODPY_PYC_MAGIC_TAG:S/./-samba4/}
SUBST_VARS +=		SAMBA_PYTHON_MAGIC_TAG


SAMBA_CONFIG =		${PREFIX}/share/examples/samba/smb.conf.default
SAMBA_LOGDIR =		${VARBASE}/log/samba

SUBST_VARS +=		SAMBA_LOGDIR

post-patch:
	find ${WRKSRC} -type f -exec ${MODPY_BIN_ADJ} {} +
	find ${WRKSRC}/third_party/heimdal/ -name version-script.map -exec \
	    sed -i "s/^[A-Z0-9._-]* {/{/" {} +

post-install:
	# removing extra files
	find ${PREFIX} \( \
	    -name '*${PATCHORIG}' -o \
	    -name '*.beforesubst' -o \
	    -name '*.deconforig' \) \
		-delete
	# precompiling Python modules
	${MODPY_BIN} ${MODPY_LIBDIR}/compileall.py ${WRKINST}${MODPY_SITEPKG}
	${MODPY_BIN} -O ${MODPY_LIBDIR}/compileall.py ${WRKINST}${MODPY_SITEPKG}
	# install samba docs and sample config
	${INSTALL_DATA_DIR} ${PREFIX}/share/{doc,examples}/samba
	cp -R ${WRKDIST}/examples/* ${PREFIX}/share/examples/samba
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/examples/samba
	find ${PREFIX}/share/examples/samba \
	     -type f -exec chmod ${SHAREMODE} {} + -o \
	     -type d -exec chmod ${DIRMODE} {} +
	sed -e 's:/usr/spool/samba:/var/spool/samba:g' \
	     -e 's:/usr/local/samba/var/log:${SAMBA_LOGDIR}/smbd:g' \
	     -e 's:MYGROUP:WORKGROUP:' \
	     ${WRKDIST}/examples/smb.conf.default > ${SAMBA_CONFIG}.tmp && \
	    mv ${SAMBA_CONFIG}.tmp ${SAMBA_CONFIG}

.include <bsd.port.mk>
