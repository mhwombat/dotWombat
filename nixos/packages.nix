{ config, pkgs, options, ... }:

with pkgs;
{

  nixpkgs.overlays = [
    (import /home/amy/nix-overlays/default.nix)
  ];

  # Packages I want to use
  environment.systemPackages = [
    alacritty
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    auctex
    bash
    bibclean
    bibutils
    bind # for dig
    binutils-unwrapped
    # busybox overwrites realpath!
    cabal-install
    cairo
    calibre
    chromium
    # conda # python package manager
    csvkit
    curl
    # dia
    diff-pdf
    diffpdf
    dmenu
    dmidecode # system hardware info
    # docker
    dos2unix
    dzen2
    (import ./emacs.nix { inherit pkgs; })
    evince
    fbreader
    file
    firefox
    font-awesome
    fzy
    ghc
    ghostscript # for pdf2dsc
    gitAndTools.gitFull
    git-crypt
    gitit
    git-lfs
    gimp
    glabels
    gmp # GNU multiple precision arithmetic library
    gnome3.adwaita-icon-theme # to help meld?
    gnome3.dconf
    gnome3.dconf-editor
    gnome3.eog
    gnome3.gnome-disk-utility
    gnome3.gucharmap
    gnome3.librsvg # for rsvg-convert
    gnome3.meld
    gnome3.gnome-themes-extra # to fix "adwaita" bug
    gnumake
    gnupg
    gnutls
    gparted
    graphviz
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
    hello-amy
    hplip
    hplipWithPlugin
    imagemagick
    inkscape
    iosevka # font
    ispell
    jdk
    jot
    jupyter
    kitty
    lftp
    libertine
    libreoffice
    libsForQt5.okular
    libsForQt5.spectacle # replaced ksnapshot
    libwacom
    lm_sensors
    lsof
    lshw
    lxqt.qterminal
    memtester
    mkpasswd
    mupdf
    ncompress
    nix-index # provides nix-locate
    nix-prefetch-git
    offlineimap
    onedrive
    openjdk
    opera
    p7zip
    pandoc
    pdfgrep
    pdfmod
    pdftk
    # podman
    pup # for parsing HTML
    python
    # python2Env
    python3Env
    qpdf
    qpdfview
    # rEnv
    rsync
    semantik # mind mapping
    signal-desktop
    spaceship-prompt
    stack
    sxiv
    tabula # extract tables from PDF files
    # tectonic
    telnet
    texstudio
    texlive.combined.scheme-full
    thunderbird
    tree
    ugrep
    unrar
    unzip
    usbutils
    vistafonts # True-type fonts from MS Windows
    vlc
    # vmware-horizon-client
    wacomtablet
    wget
    wpa_supplicant
    x11
    xed-editor
    xf86_input_wacom
    xmonad-with-packages
    xorg.libX11
    xorg.libXft
    xorg.xev
    xscreensaver
    xsel
    zip
    zsh
  ];
}
