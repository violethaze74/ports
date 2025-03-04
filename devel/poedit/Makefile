COMMENT=	cross-platform gettext catalogs (PO-files) editor

V=		3.3.1
DISTNAME=	poedit-${V}
CATEGORIES=	devel textproc

HOMEPAGE=	https://www.poedit.net/

MAINTAINER=	Omar Polo <op@openbsd.org>

MASTER_SITES=	https://github.com/vslavik/poedit/releases/download/v${V}-oss/

# MIT
PERMIT_PACKAGE=	Yes

WANTLIB += c m pthread ${COMPILER_LIBCXX}
WANTLIB += atk-1.0 boost_regex-mt boost_system boost_thread-mt
WANTLIB += cairo cairo-gobject enchant-2 gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gobject-2.0 gtk-3 gtkspell3-3 harfbuzz icudata
WANTLIB += icui18n icuuc intl lucene++ pango-1.0 pangocairo-1.0 pugixml
WANTLIB += wx_baseu-3.2 wx_baseu_net-3.2 wx_baseu_xml-3.2 wx_gtk3u_adv-3.2
WANTLIB += wx_gtk3u_core-3.2 wx_gtk3u_xrc-3.2 wx_gtk3u_webview-3.2

# C++14
COMPILER=	base-clang ports-gcc

BUILD_DEPENDS=	textproc/nlohmann-json
RUN_DEPENDS=	devel/desktop-file-utils \
		devel/gettext,-tools \
		x11/gtk+4,-guic
LIB_DEPENDS=	textproc/gtkspell3 \
		textproc/luceneplusplus \
		textproc/pugixml \
		x11/wxWidgets,-webview

CONFIGURE_STYLE=gnu

.include <bsd.port.mk>
