{ config, pkgs, options, ... }:

{
  # Allow software with an unfree license
  nixpkgs.config.allowUnfree = true;

  # Set the JAVA_HOME environment variable
  programs.java.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  nixpkgs.config.pulseaudio = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the OpenSSH server.
  services.sshd.enable = true;

  # Enable garbage collection
  nix.gc.automatic = true;
  nix.gc.dates = "06:15";

  # Enable Nix flakes
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = "experimental-features = nix-command flakes";

  xdg.mime.defaultApplications = {
    "text/plain" = "emacs";
    "application/pdf" = "okular.desktop";
  };

  # This stuff is to get gcolor3 eyedropper working!
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk  pkgs.xdg-desktop-portal-wlr ];
  xdg.portal.gtkUsePortal = true;
  xdg.portal.wlr.enable = true;
  
  programs.zsh.enable = true;

  # users.defaultUserShell = pkgs.zsh;

  # These variables end up in /etc/set-environment.
  # They may not take effect until you log out and back in again.
  environment.variables = {
    # Keep home directories clean by using XDG locations
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    # To see all keyboard layouts: localectl list-x11-keymap-layouts
    XKB_DEFAULT_LAYOUT = "ie,gr";
    # To see all keyboard variants: localectl list-x11-keymap-variants
    XKB_DEFAULT_VARIANT = "CloGaelach,";
    # To see all keyboard options: localectl list-x11-keymap-options
    # Configure Alt+CapsLock to switch between keyboard layouts.
    XKB_DEFAULT_OPTIONS = "compose:rctrl-altgr,grp:alt_caps_toggle";
    STACK_ROOT = "$XDG_DATA_HOME/stack"; # Stack
    LESSHISTFILE = "$XDG_CACHE_HOME/history"; # less
#    XCOMPOSEFILE = "$XDG_CONFIG_HOME/X11/xcompose"; # libX11
#    XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose"; # libX11
#    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority"; # xorg-auth
    ZDOTDIR = "$XDG_CONFIG_HOME/zsh"; # zsh
    # MOZ_ENABLE_WAYLAND = "1"; # enable wayland support in Firfox
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amy = {
    isNormalUser = true;
    home = "/home/amy";
    description = "Amy de Buitleir";
    extraGroups = [ "wheel" "networkmanager" "vboxsf" "docker" "audio" ];
    uid = 1000;
    shell = pkgs.zsh;
#    shell = pkgs.bashInteractive;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
