#!/usr/bin/env bash
set -euxo pipefail

# ./configure --prefix=../initramfs --exec-prefix=../

# make -C linux defconfig
# make -C linux -j$(nproc)

cc -static init.c -o initramfs/init

cd initramfs
find . | cpio -ov --format=newc > ../initramfs.cpio
cd ..

qemu-system-x86_64 \
    -kernel linux/arch/x86_64/boot/bzImage \
    -initrd initramfs.cpio \
    -nographic \
    -append "console=ttyS0"
