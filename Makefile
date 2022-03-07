MODULES = jailed
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Hackogram
DISPLAY_NAME = Instagram
BUNDLE_ID = com.opa334.hackogram

Hackogram_FILES = Init.x SideloadedFixes.x
#Hackogram_IPA = ../../IPA/Instagram_221.0.ipa
Hackogram_IPA = Instagram.ipa
#Hackogram_INJECT_DYLIBS = Rocket.dylib

include $(THEOS_MAKE_PATH)/tweak.mk
