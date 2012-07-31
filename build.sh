#!/bin/bash -x
CYANOGENMOD=../../..

# Make mrproper
#make mrproper

# Set config
#make CM10_Pascal2_defconfig
make menuconfig

# Make modules
nice -n 10 make -j2 modules

# Copy modules
find -name '*.ko' -exec cp -av {} $CYANOGENMOD/device/rockchip/pascal2/modules/ \;

# Build kernel
nice -n 10 make -j2 kernel.img
# Copy kernel
cp kernel.img $CYANOGENMOD/device/rockchip/pascal2/kernel

# Make mrproper
#make mrproper

