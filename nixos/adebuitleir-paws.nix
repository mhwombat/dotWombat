{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # Enable VMware tools.
  virtualisation.vmware.guest.enable = true;
}
