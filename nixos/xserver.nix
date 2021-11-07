{ config, ... }:

{
  services.xserver = {
    enable = true;
    layout = "ie";

    # XMonad
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
      ];
    };

    windowManager.qtile = {
      enable = true;
    };
    
    # Enable the KDE Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    displayManager.sessionCommands =
      "
          xsetroot -solid '#FFE0FF'
      ";
  };

  

}
