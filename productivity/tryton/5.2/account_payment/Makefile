MODPY_EGG_VERSION =	5.2.4
TRYTON_MODULE =		account_payment
REVISION =		3

TRYTON_DEPENDS +=	account \
			company \
			currency \
			party

RUN_DEPENDS +=		databases/py-sql${MODPY_FLAVOR}

TRYTON_TEST_DEPENDS +=	account_invoice

.include <bsd.port.mk>
