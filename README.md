# Linux RCs binaries

This repository will automatically build binaries from Linux RCs (Release Candidates)

# Installation
- Decompress release a tar file in your filesystem with `sudo tar -hxvf linuxRC.tar.gz -C / --no-same-owner`
  - Notes:
  - `-h` follows symlinks
  - `--no-same-owner` makes root the owner of the extracted files
- Generate initramfs: `sudo mkinitcpio -k <version> -g /boot/initramfs-linuxRC.img` where <version> is the version you just uncompressed in `/lib/modules`, e.g. `6.10.0-rc4`
- Regen grub config: `sudo grub-mkconfig -o /boot/grub/grub.cfg`
- Next time you reboot, choose the "LinuxRC" entry. It will probably be in the "advanced options" grub submenu
