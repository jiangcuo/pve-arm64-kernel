#!/bin/bash

version="0.0.2"
echo "cross_build use Script $version"

usage ()
{
     echo "usage: cross_build aarch64"
     echo "available build :"
     echo "aarch64 : Compile Aarch64"
     echo "riscv64 : Compile Riscv64"
     echo "-h: Show help"
}

compile_aarch64() {
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
}

compile_riscv64() {
CROSS_COMPILE=riscv64-linux-gnu- \
ARCH=riscv \
KERNEL_BUILD_ARCH=riscv64 \
DEB_BUILD_GNU_TYPE=riscv64-linux-gnu- \
DEB_BUILD_ARCH=riscv64 \
DEB_BUILD_OPTIONS=nostrip \
CONFIG_SITE=/etc/dpkg-cross/cross-config.riscv64 \
CC=/usr/bin/riscv64-linux-gnu-gcc \
CROSS_COMPILE=riscv64-linux-gnu- \
dpkg-buildpackage -b -us -uc -ariscv64 -Pcross,nocheck -d
}

parse_args ()
{
    while [ $# -ne 0 ]
    do
        case "${1}" in
            aarch64)
                shift
                compile_aarch64
                ;;
            riscv64)
                shift
                compile_riscv64
                ;;
            -h|--help)
                usage
                ;;
            *)
                echo "Invalid argument : ${1}" >&2
                usage >&2
                exit 1
                ;;
        esac
        shift
    done

}

parse_args "$@"
