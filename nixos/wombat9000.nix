{ config, pkgs, ... }:

{
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
}