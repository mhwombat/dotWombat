{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp67s0.useDHCP = true;
  networking.interfaces.enp68s0.useDHCP = true;
  networking.interfaces.wlo2.useDHCP = true;

#  networking.networkmanager.unmanaged = [
#   "*" "except:type:wwan" "except:type:gsm"
#  ];

  networking.wireless.interfaces = [ "wlo2" ];

  networking.wireless.networks = {
    "FRITZ!Box 7530 NU" = {
      #psk="06595740189834774079"; # WLAN Network Key (WPA2)
      # Find this using the command wpa_passphrase 'FRITZ!Box 7530 NU' 06595740189834774079
      pskRaw = "6d89c405b8cbf2899d7254011f1ac901a1e9287d6566ca48f607fe03a5a71452";
    };
  };

  # Printer
  services.printing.drivers = [ pkgs.hplipWithPlugin ];

  # Scanner
  hardware.sane.netConf = "192.168.178.29";
}
