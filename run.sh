#!/usr/bin/env bash
set -euxo pipefail

cc -static init.c -o init
echo init | cpio -o --format=newc > initramfs

qemu-system-x86_64 \
    -kernel linux/arch/x86_64/boot/bzImage \
    -initrd initramfs \
    -nographic \
    -append "console=ttyS0"
