{ config, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "uk";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver = {
    enable = true;
    layout = "ie";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
      ];
    };
  };
}
