# github.com/kyleconroy/sqlc/internal/engine/sqlite/parser fails on LP32
ONLY_FOR_ARCHS =	aarch64 amd64

COMMENT =	create type safe go from SQL

MODGO_MODNAME =	github.com/kyleconroy/sqlc
MODGO_VERSION =	v1.12.0
REVISION =	0

DISTNAME =	sqlc-${MODGO_VERSION}

CATEGORIES =	devel

# MIT
PERMIT_PACKAGE =	Yes

WANTLIB += c pthread

MODULES =	lang/go
MODGO_LDFLAGS =	-X "github.com/kyleconroy/sqlc/internal/cmd.version=${MODGO_VERSION}"

NO_TEST =	Yes

.include "modules.inc"

.include <bsd.port.mk>
