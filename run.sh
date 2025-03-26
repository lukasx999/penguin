#!/usr/bin/env bash
set -euxo pipefail

# ./configure --prefix=/home/lukas/code/repos/penguin/musl-bin \

# make -C linux defconfig
# make -C linux -j$(nproc)

cc -static init.c -o init
    # `pkg-config --cflags libdrm` \
    # `pkg-config --libs libdrm`

find init musl-bin | cpio -o --format=newc > initramfs

qemu-system-x86_64 \
    -kernel linux/arch/x86_64/boot/bzImage \
    -initrd initramfs \
    -nographic \
    -append "console=ttyS0"
