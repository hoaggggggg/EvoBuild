#!/bin/bash

cd out/target/product/tdgsi_arm64_ab
xz -9 -T0 -v -z system.img
curl -T $FILENAME https://oshi.at/${FILENAME}/${OUTPUT} > mirror.txt || { echo "WARNING: Failed to Mirror the Build!"; }
FILE_PATH="out/target/product/tdgsi_arm64_ab/system.img.xz"
UPLOAD_RESPONSE=$(curl -T "$FILE_PATH" https://oshi.at/) || { echo "ERROR: Failed to Upload the File!"; exit 1; }
DOWNLOAD_LINK=$(echo "$UPLOAD_RESPONSE" | grep -oP '"downloadUrl"\s*:\s*"\K([^"]*)') || { echo "ERROR: Failed to Extract Download Link!"; exit 1; }
echo "Upload successful! Download Link: ${DOWNLOAD_LINK}"
