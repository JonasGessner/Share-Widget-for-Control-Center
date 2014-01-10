ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:7.0

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

BUNDLE_NAME = ShareWidgetforControlCenter
ShareWidgetforControlCenter_CFLAGS = -fobjc-arc
ShareWidgetforControlCenter_FILES = ShareWidgetforControlCenterSection.m ShareWidgetforControlCenterSectionView.m
ShareWidgetforControlCenter_INSTALL_PATH = /Library/CCLoader/Bundles
ShareWidgetforControlCenter_FRAMEWORKS = Foundation UIKit CoreGraphics Social

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 backboardd"