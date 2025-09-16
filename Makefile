TARGET = iphone:clang:latest:13.0
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomClock

CustomClock_FILES = Tweak.xm CustomClockView.swift
CustomClock_FRAMEWORKS = UIKit
CustomClock_SWIFTFLAGS = -swift-version 5

include $(THEOS_MAKE_PATH)/tweak.mk
