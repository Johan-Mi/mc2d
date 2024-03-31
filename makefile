SC2 := $(shell which scratch-compiler-2)
SRC_FILES := $(shell find src -type f)
# This should include the resource pack but scanning through all of those files
# takes too long. If you change any textures, run `make -B`.
ASSETS := assets/*.* assets/build/oak_leaves.png
export SC2_COMMENT := {"framerate":0} // _twconfig_

project.sb3: $(SC2) $(SRC_FILES) $(ASSETS)
	$(SC2) compile src/main.sc2

check: $(SC2) $(SRC_FILES) $(ASSETS)
	$(SC2) check src/main.sc2
.PHONY: check

assets/build/oak_leaves.png: assets/block/oak_leaves.png
	magick $< -define png:colortype=2 -color-matrix "0.4 0 0 1 0 0 0 0 0" $@
