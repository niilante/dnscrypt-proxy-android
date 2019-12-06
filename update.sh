#!/bin/bash

BUILD_DIR=$(pwd)
version=2.0.34

cd $BUILD_DIR
mkdir -p temp
cd temp
echo "Downloading..."
#wget -q https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/$version/dnscrypt-proxy-android_DCP-$version.zip
wget -q https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/$version/dnscrypt-proxy-android_arm64-$version.zip
wget -q https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/$version/dnscrypt-proxy-android_arm-$version.zip
wget -q https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/$version/dnscrypt-proxy-android_i386-$version.zip
wget -q https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/$version/dnscrypt-proxy-android_x86_64-$version.zip
echo "Unzipping..."
#unzip -op dnscrypt-proxy-android_dcp-$version.zip android-dcp/dnscrypt-proxy > $BUILD_DIR/binaries/dcp
unzip -op dnscrypt-proxy-android_arm64-$version.zip android-arm64/dnscrypt-proxy > $BUILD_DIR/binaries/dnscrypt-proxy-arm64
unzip -op dnscrypt-proxy-android_arm-$version.zip android-arm/dnscrypt-proxy > $BUILD_DIR/binaries/dnscrypt-proxy-arm
unzip -op dnscrypt-proxy-android_i386-$version.zip android-i386/dnscrypt-proxy > $BUILD_DIR/binaries/dnscrypt-proxy-i386
unzip -op dnscrypt-proxy-android_x86_64-$version.zip android-x86_64/dnscrypt-proxy > $BUILD_DIR/binaries/dnscrypt-proxy-x86_64
rm -rf $BUILD_DIR/temp
exit
