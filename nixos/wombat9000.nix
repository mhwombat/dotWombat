{ config, pkgs, ... }:

{
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.wireless.enable = true;

  networking.wireless.networks = {
    "eircom-40689925 5G" = {
      psk = "xxxxxxxxx";
    };
  };
}
