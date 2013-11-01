include theos/makefiles/common.mk
TWEAK_NAME = FullKarma
FullKarma_FILES = Tweak.xm
FullKarma_PRIVATE_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
