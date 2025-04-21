# Linux RCs binaries

This repository will automatically build binaries from Linux RCs (Release Candidates)

# Usage
## Building
To build the latest rc, check [the CI (not enabled in this repo anymore, but you can copy what it does)](.github/workflows/build.yml)
## Installation (for Arch Linux)
- Decompress the tar file in your filesystem with `sudo tar -hxvf linuxRC.tar.gz -C / --no-same-owner`
  - Notes:
  - `-h` follows symlinks
  - `--no-same-owner` makes root the owner of the extracted files
- Generate initramfs: `sudo mkinitcpio -k <version> -g /boot/initramfs-linuxRC.img` where <version> is the version you just uncompressed in `/lib/modules`, e.g. `6.10.0-rc4`
- Regen grub config: `sudo grub-mkconfig -o /boot/grub/grub.cfg`
- Next time you reboot, choose the "LinuxRC" entry. It will probably be in the "advanced options" grub submenu

# Installation for other distros
TODO, see https://github.com/iTrooz/Linux-rc/issues/3. The kernel provided should work, but for now you will need to figure out how to boot it.
