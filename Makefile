export TROLLSTORE ?= 0

MODULES = jailed
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Hackogram
DISPLAY_NAME = Instagram

Hackogram_FILES = Init.x

ifeq ($(TROLLSTORE),1)
BUNDLE_ID = com.burbn.instagram
Hackogram_CFLAGS += -D TROLLSTORE=1
else
BUNDLE_ID = com.opa334.hackogram
Hackogram_FILES += SideloadedFixes.x
endif

# add your paths here
Hackogram_IPA = $(IPA_PATH)/Instagram_250.0.ipa
Hackogram_INJECT_DYLIBS = $(IPA_DYLIB_PATH)/Rocket.dylib

include $(THEOS_MAKE_PATH)/tweak.mk
