#!/bin/sh
set -xe

src_dir=$(realpath "linux")
pkg_dir=$(realpath "package")
name="linuxAB" # TODO

if [ ! -d "$src_dir" ]; then
    echo "Error: Source directory '$src_dir' does not exist."
    exit 1
fi

# Reset package dir
rm -rf $pkg_dir
mkdir $pkg_dir

# Go to source directory
cd $src_dir

# Package kernel
mkdir $pkg_dir/boot
cp -v arch/x86/boot/bzImage $pkg_dir/boot/vmlinuz-linuxAB

# Package modules
# No ZSTD_CLEVEL because it takes too long
export INSTALL_MOD_PATH=$pkg_dir
export INSTALL_MOD_STRIP=1
time make modules_install -j $(nproc)

# Finalize package
cd $pkg_dir
tar -czvf ../linuxAB.tar.gz *
