BROKEN-i386 =	unix.EPROTO not defined

COMMENT =	modern overlay-like VPN built on top of WireGuard

V =		1.38.4
MODGO_MODNAME =	tailscale.com
MODGO_VERSION =	v${V}

DISTNAME =	tailscale.com-${MODGO_VERSION}
PKGNAME =	tailscale-${V}

CATEGORIES =	net

HOMEPAGE =	https://tailscale.com/

MAINTAINER =	Aaron Bieber <abieber@openbsd.org>

# BSD-3
PERMIT_PACKAGE =	Yes

WANTLIB += c pthread

MODULES =		lang/go

MODGO_LDFLAGS +=	-X tailscale.com/version.longStamp=${V}
MODGO_LDFLAGS +=	-X tailscale.com/version.shortStamp=${V}

WRKDIST =	${WRKSRC}

.include "modules.inc"

.include <bsd.port.mk>
