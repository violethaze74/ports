QT6NAME =	QtShaderTools
COMMENT =	Qt6 shader tools module
PKGSPEC =	qt6-qtshadertools-${QT6_PKGSPEC}

SHARED_LIBS =  Qt6ShaderTools              2.0 # 6.5

WANTLIB += ${COMPILER_LIBCXX} GL Qt6Core Qt6Gui c m xkbcommon

BUILD_DEPENDS =	graphics/vulkan-loader

LIB_DEPENDS =	x11/xkbcommon

.include <bsd.port.mk>
