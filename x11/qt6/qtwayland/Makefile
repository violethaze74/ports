QT6NAME =	QtWayland
COMMENT =	Qt6 module for Wayland support
PKGSPEC =	qt6-qtwayland-${QT6_PKGSPEC}

SHARED_LIBS +=  Qt6WaylandClient                     2.1 # 6.5
SHARED_LIBS +=  Qt6WaylandCompositor                 1.0 # 6.5
SHARED_LIBS +=  Qt6WaylandEglClientHwIntegration     1.0 # 6.5
SHARED_LIBS +=  Qt6WaylandEglCompositorHwIntegration 1.0 # 6.5
SHARED_LIBS +=  Qt6WlShellIntegration                1.0 # 6.5

WANTLIB += ${COMPILER_LIBCXX} EGL GL Qt6Core Qt6Gui Qt6Network
WANTLIB += Qt6OpenGL Qt6Qml Qt6QmlModels Qt6Quick c m wayland-client
WANTLIB += wayland-cursor wayland-egl wayland-server xkbcommon

LIB_DEPENDS =	wayland/wayland \
		x11/qt6/qtdeclarative \
		x11/xkbcommon

BUILD_DEPENDS =	graphics/vulkan-headers \
		wayland/wayland-protocols \
		x11/qt6/qtshadertools

.include <bsd.port.mk>
