#!/bin/bash
set -ex

rm -rf build
mkdir -p build
mkdir -p dist

echo "Android Build"

export ANDROIDAPI=26
export NDKAPI=21
echo ANDROIDNDK=$ANDROIDNDK
echo ANDROIDSDK=$ANDROIDSDK

mkdir -p build/ah_android

cp *.py build/ah_android/
mv build/ah_android/ah.py build/ah_android/main.py 

python3 -m pythonforandroid.toolchain apk --icon gfx/window-icon.png --private ./build/ah_android --package cc.tiainen.jani.ah --name "ah"  --version 0.1 --bootstrap=sdl2 --requirements=python3,pygame2 --orientation landscape --dist-name ah --add-asset gfx --add-asset fonts --add-asset sfx --add-asset music
