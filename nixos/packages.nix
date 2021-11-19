{ config, pkgs, options, ... }:

with pkgs;
{

  nixpkgs.overlays = [
    (import /home/amy/nix-overlays/default.nix)
  ];

  # Packages I want to use
  environment.systemPackages = [
    alacritty # X and wayland
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    autotiling
    base16-builder
    base16-shell-preview
    base16-universal-manager
    bash
    bemenu
    bibclean
    bibutils
    bind # for dig
    binutils-unwrapped
    # busybox overwrites realpath!
    cabal-install
    calibre # X and wayland
    chromium # X-only? See ozone?
    clipman
    colorls
    csvkit
    curl
    dialog
    diff-pdf
    diffpdf
    dmenu # X-only
    dmenu-wayland
    dmidecode # system hardware info
    dos2unix
    dzen2
    (import ./emacs.nix { inherit pkgs; }) # X-only
    evince # X and wayland
    exa
    fbreader # X only. Binary is called "FBReader"
    file
    #    firefox # X and wayland
    firefox-wayland
    flameshot
    font-awesome
    foot
    fzf
    fzy
    gcolor3
    ghc
    ghostscript # for pdf2dsc
    gitAndTools.gitFull
    git-crypt
    gitit
    git-lfs
    gimp # Current version is X-only. Newer versions support wayland
    # glabels
    gmp # GNU multiple precision arithmetic library
    gnome3.adwaita-icon-theme # to help meld?
    gnome3.dconf-editor # X and wayland
    gnome3.eog # X and wayland
    gnome3.gnome-disk-utility # X and wayland
    gnome3.gucharmap # X and wayland
    gnome3.librsvg # for rsvg-convert
    gnome3.meld # X and wayland
    gnome3.gnome-themes-extra # to fix "adwaita" bug
    gnumake
    gnupg
    gnutls
    go
    gparted # X and wayland?
    graphviz
    grim
    hardinfo
    haskellPackages.cabal-fmt
    haskellPackages.citeproc
    # haskellPackages.doi # broken as of 21.05
    haskellPackages.hasktags
    haskellPackages.hlint
    haskellPackages.pandoc
    haskellPackages.pandoc-crossref
    haskellPackages.pandoc-types
    # haskellPackages.pandoc-include # broken as of 21.05
    # haskellPackages.rasa # broken as of 21.05
    # haskellPackages.stylish-cabal # broken as of 21.05
    haskellPackages.stylish-haskell
    haskellPackages.template
    # haskellPackages.X11-xft
    havoc
    hello-amy
    howl
    hplip
    hplipWithPlugin
    i3status-rust
    imagemagick
    imv
    inkscape # X and wayland
    iosevka # font
    ispell
    jot
    jupyter
    killall
    kitty # X and wayland
    lftp
    libertine
    libreoffice # X and wayland
    libsForQt5.okular
    libsForQt5.spectacle # Buggy on wayland # replaced ksnapshot
    libsForQt512.kcolorpicker
    libwacom
    libxml2 # for xmllint
    lm_sensors
    lsof
    lshw
    lxqt.qterminal # X and wayland
    memtester
    mkpasswd
    most # alternative to "less"
    mupdf # X-only
    mustache-go
    ncompress
    nix-index # provides nix-locate
    nix-prefetch-git
    nnn
    offlineimap
    onedrive
    opera # X and wayland, invoke with opera --enable-features=UseOzonePlatform --ozone-platform=wayland %U
    p7zip
    pandoc
    pdfgrep
    pdfmod
    pdftk
    plan9port
    plantuml
    # podman enabled in containers.nix
    poppler_utils # for pdfinfo
    pup # for parsing HTML
    python
    # python2Env
    python3Env
    qpdfview # X and wayland
    qtile # X and wayland
    # rEnv
    ristate
    river
    rootbar
    rsync
    signal-desktop # X-only
    slurp
    spaceship-prompt
    stack
    swappy
    # sway enabled in wayland.nix
    sxiv # X-only
    tabula # extract tables from PDF files
    # tectonic
    telnet
    texlive.combined.scheme-full
    thunderbird # X and wayland
    # tree # temporarily broken
    ugrep
    unrar
    unzip
    usbutils
    vistafonts # True-type fonts from MS Windows
    vlc # X-only until I set QT environment
    # vmware-horizon-client
    wacomtablet
    waybar
    wayland-utils
    wev # X and wayland, installed with sway by default
    wget
    wl-clipboard
    wofi
    wpa_supplicant
    # x11
    xcolor
    xdg-launch
    xdg-utils
    xf86_input_wacom
    xqilla
    xmlstarlet
    xmobar
    xmonad-with-packages
    # xorg.libX11
    # xorg.libXft
    xorg.xev # X-only, use wev instead
    xscreensaver # X-only
    xsel # X-only, use wl-clipboard's wl-copy and wl-paste instead
    yad
    yambar
    zip
    zsh
  ];
}
