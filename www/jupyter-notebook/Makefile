COMMENT =		web-based notebook for interactive computing

MODPY_EGG_VERSION =	6.2.0
DISTNAME =		notebook-${MODPY_EGG_VERSION}
PKGNAME =		jupyter-notebook-${MODPY_EGG_VERSION}

CATEGORIES =		www devel

HOMEPAGE =		https://jupyter.org/

# BSD
PERMIT_PACKAGE =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_PYBUILD =		setuptools

RUN_DEPENDS =		devel/py-ipykernel${MODPY_FLAVOR} \
			devel/py-ipython_genutils${MODPY_FLAVOR} \
			devel/py-jupyter_client${MODPY_FLAVOR}>=5.3.4 \
			devel/py-jupyter_core${MODPY_FLAVOR}>=4.6.1 \
			devel/py-nbconvert${MODPY_FLAVOR} \
			devel/py-nbformat${MODPY_FLAVOR} \
			devel/py-send2trash${MODPY_FLAVOR}>=1.5.0 \
			devel/py-traitlets${MODPY_FLAVOR}>=4.2.1 \
			net/py-zmq${MODPY_FLAVOR}>=17 \
			security/py-argon2-cffi${MODPY_FLAVOR} \
			sysutils/py-prometheus_client${MODPY_FLAVOR} \
			www/py-jinja2${MODPY_FLAVOR} \
			www/py-terminado${MODPY_FLAVOR}>=0.8.3 \
			www/py-tornado${MODPY_FLAVOR}>=6.1

TEST_DEPENDS =		devel/py-coverage${MODPY_FLAVOR} \
			devel/py-nose${MODPY_FLAVOR} \
			devel/py-nose-warnings-filters${MODPY_FLAVOR} \
			devel/py-nbval${MODPY_FLAVOR} \
			www/py-requests${MODPY_FLAVOR} \
			www/py-requests-unixsocket${MODPY_FLAVOR} \
			www/py-selenium${MODPY_FLAVOR}

# XXX once we have a port of pandoc, we can make docs.

# XXX exclude selenium tests as recommended, and exclude tests that use
# send2trash as they error out with "Trashing on system internal mounts is not
# supported".
do-test:
	cd ${WRKSRC} && env LC_CTYPE=C.UTF-8 HOME=${WRKSRC} \
		${LOCALBASE}/bin/nosetests${MODPY_BIN_SUFFIX} notebook -v \
		--exclude=delete --exclude=follow_file --exclude=selenium

.include <bsd.port.mk>
