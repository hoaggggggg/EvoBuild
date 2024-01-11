#!/bin/bash

cd device/phh/treble
bash generate.sh evo
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_MAXSIZE=50G
source build/envsetup.sh
ccache -M 50G -F 0
lunch treble_arm64_bgN-userdebug 
make systemimage -j$(nproc --all)
