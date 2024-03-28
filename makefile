SC2 := $(shell which scratch-compiler-2)
SRC_FILES := $(shell find src -type f)
# This should include the resource pack but scanning through all of those files
# takes too long. If you change any textures, run `make -B`.
ASSETS := assets/*.*
export SC2_COMMENT := {"framerate":0} // _twconfig_

project.sb3: $(SC2) $(SRC_FILES) $(ASSETS)
	$(SC2) compile src/main.sc2

check: $(SC2) $(SRC_FILES) $(ASSETS)
	$(SC2) check src/main.sc2
.PHONY: check
