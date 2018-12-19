{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/R.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.initrd.checkJournalingFS = false;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "uk";
    defaultLocale = "en_IE.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  environment.systemPackages = let
    jot = pkgs.haskellPackages.callPackage /home/amy/jot/jot.nix {};
  in
    [ jot ] ++ (with pkgs; [
      auctex
      bash
      binutils-unwrapped
      cabal2nix
      curl
      dmenu2
      docker
      dzen2
      # emacs
      (import /home/amy/dotWombat/etc/nixos/emacs.nix { inherit pkgs; })
      firefox
      gcc
      ghc
      ghostscript # for pdf2dsc
      gitAndTools.gitFull
      gnome3.dconf
      gnome3.dconf-editor
      gnome3.gnome-disk-utility
      gnome3.meld
      gnumake
      gnupg
      haskellPackages.cabal-install
      haskellPackages.stylish-haskell
      haskellPackages.X11-xft
      kdeApplications.okular
      libreoffice
      lxqt.qterminal
      nix-prefetch-git
      pandoc
      pdfmod
      pkgconfig
      python
      python3
      python36Packages.csvkit
      rEnv
      rsync
      stack
      sxiv
      tectonic
      texstudio
      texlive.combined.scheme-basic
      tree
      unison
      vlc
      x11
      xmonad-with-packages
      xorg.libX11
      xsel
      wget
    ]);

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
#  services.xserver.enable = true;
#  services.xserver.layout = "uk";
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

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    home = "/home/amy";
    description = "Amy de Buitleir";
    extraGroups = [ "wheel" "networkmanager" "vboxsf" ];
    uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

}
