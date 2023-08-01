#!/bin/bash
CROSS_COMPILE=aarch64-linux-gnu- \
ARCH=arm64 \
KERNEL_BUILD_ARCH=arm64 \
DEB_BUILD_GNU_TYPE=aarch64-linux-gnu- \
DEB_BUILD_ARCH=arm64 \
DEB_BUILD_OPTIONS=nostrip \
CONFIG_SITE=/etc/dpkg-cross/cross-config.arm64 \
CC=/usr/bin/aarch64-linux-gnu-gcc \
CROSS_COMPILE=aarch64-linux-gnu- \
dpkg-buildpackage -b -us -uc  -aarm64 -Pcross,nocheck -d
