#!/bin/bash

# SkyrimTogether Egg Installation Script
# Author: Hayden Andreyka (haydenandreyka@gmail.com)
# Base image: tiltedphoques/builder:x86_64 AS builder

# Used as reference: https://github.com/tiltedphoques/TiltedEvolution/blob/master/Dockerfile

# Install dependencies
echo "##### INSTALL DEPENDENCIES #####"
apt-get update
# apt-get install -y git make cmake curl tar zip unzip sudo build-essentials gcc-12 g++-12 pkg-config
apt-get install -y gcc-12 g++-12 git curl build-essential
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 110 --slave /usr/bin/g++ g++ /usr/bin/g++-12 --slave /usr/bin/gcov gcov /usr/bin/gcov-12

# Install xmake
echo "##### INSTALL XMAKE #####"
bash <(curl -fsSL https://raw.githubusercontent.com/xmake-io/xmake/master/scripts/get.sh)

# cd /tmp
# git clone --depth=1 "https://github.com/xmake-io/xmake.git" --recursive xmake
# cd xmake
# ./scripts/get.sh __local__

# Install vcpkg
# echo "##### INSTALL VCPKG #####"
# cd /tmp
# git clone https://github.com/Microsoft/vcpkg.git vcpkg
# cd vcpkg
# ./bootstrap-vcpkg.sh
# export VCPKG_ROOT=/tmp/vcpkg/

# Install vcpkg dependencies
# ./vcpkg install catch2

# Download release of server software
echo "##### DOWNLOAD SERVER SOFTWARE #####"
cd /tmp
git clone https://github.com/tiltedphoques/TiltedEvolution.git --recursive src
cd src
git checkout tags/v1.2.0
git submodule sync --recursive
git submodule update --init --force --recursive --depth=1

# Compile server
echo "##### COMPILE SERVER #####"

export XMAKE_ROOT=y

~/.local/bin/xmake repo --update
~/.local/bin/xmake config --arch=x64 --mode=releasedbg --yes
~/.local/bin/xmake -y

# ~/.local/bin/xmake f -y -vD
# ~/.local/bin/xmake -j`nproc` -vD
# ~/.local/bin/xmake --root -y

#objcopy --only-keep-debug /home/server/build/linux/${arch}/release/SkyrimTogetherServer /home/server/build/linux/${arch}/release/SkyrimTogetherServer.debug
#objcopy --only-keep-debug /home/server/build/linux/${arch}/release/libSTServer.so /home/server/build/linux/${arch}/release/libSTServer.debug

# Copy binaries to shared folder

#cd /home/server/package
#cp "lib/libSTServer.so" "bin/SkyrimTogetherServer" "bin/crashpad_handler" /mnt/container

#cd /home/server/build/${arch}/release
#cp "libSTServer.debug" "SkyrimTogetherServer.debug" /mnt/container

# REWRITE #

# cp /home/server/* /mnt/container

# Done!