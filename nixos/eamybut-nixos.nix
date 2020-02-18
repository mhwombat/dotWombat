{ config, pkgs, ... }:

{
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # Remove the fsck that runs at startup; it fails on a VirtualBox guest
  boot.initrd.checkJournalingFS = false;
}
