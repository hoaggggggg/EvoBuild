#!/bin/bash

git config --global user.name "your username"
git config --global user.email yourmail@example.com
mkdir evo
cd evo
repo init -u https://github.com/Evolution-X/manifest -b udc
git clone https://github.com/ahnet-69/treble_manifest.git -b evo-udc .repo/local_manifests
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
git clone https://github.com/ahnet-69/treble_evo.git .
patches/apply-patches.sh . trebledroid
