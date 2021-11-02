{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "wombat11k";

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;

    interfaces = {
      enp67s0.useDHCP = true;
      enp68s0.useDHCP = true;
      wlo2.useDHCP = true;
    };

    wireless = {
      enable = true;  # Enables wireless support via wpa_supplicant.
      interfaces = [ "wlo2" ];
      networks = {
        "FRITZ!Box 7530 NU" = {
          # Find this using the command wpa_passphrase 'FRITZ!Box 7530 NU' ??????NEW_WPA2??????
          pskRaw = "????????????????????????????????????????????????????????????????";
        };
      };
    };
  };

  # Printer
  services.printing.drivers = [ pkgs.hplipWithPlugin ];

  # Scanner
  hardware.sane.netConf = "192.168.178.29";

  # OneDrive
  services.onedrive.enable=true;
}
