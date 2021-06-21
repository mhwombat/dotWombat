{ config, pkgs, options, ... }:

with pkgs;
{

  nixpkgs.overlays = [
    (import /home/amy/nix-overlays/default.nix)
  ];

  # Packages I want to use
  environment.systemPackages = [
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
    # bookworm
    # busybox overwrites realpath!
    # cabal2nix
    cabal-install
    cairo
    calibre
    chromium
    conda # python package manager
    coolreader
    # coq
    csvkit
    curl
    cvc4
    # dbeaver
    dia
    diff-pdf
    diffpdf
    dmenu
    dmidecode # system hardware info
    docker
    dos2unix
    dzen2
    # elfutils # provides libdw
    (import ./emacs.nix { inherit pkgs; })
    evince
    fbreader
    file
    firefox
    font-awesome
    fzy
    # gcc
    # gdb
    ghc
    ghostscript # for pdf2dsc
    gitAndTools.gitFull
    gitit
    git-lfs
    gimp
    gmp # GNU multiple precision arithmetic library
    gnome3.adwaita-icon-theme # to help meld?
    gnome3.dconf
    gnome3.dconf-editor
    gnome3.eog
    gnome3.gnome-disk-utility
    gnome3.gucharmap
    gnome3.librsvg # for rsvg-convert
    gnome3.meld
    gnumake
    gnupg
    gnutls
    gparted
    graphviz
    # grsync
    # gvfs
    hardinfo
    # haskellPackages.cabal-install
    # haskellPackages.niv
    # haskellPackages.packunused # broken
    # haskellPackages.citeproc
    haskellPackages.pandoc
    haskellPackages.citeproc
    # haskellPackages.pandoc-citeproc # replaced by haskellPackages.citeproc in 21.05
    haskellPackages.pandoc-crossref
    haskellPackages.pandoc-types
    # haskellPackages.pandoc-include # broken
    haskellPackages.stylish-haskell
    haskellPackages.template
    haskellPackages.X11-xft
    hdf5
    hdfview
    hello-amy
    hplip
    hplipWithPlugin
    imagemagick
    inkscape
    iosevka # font
    ispell
    jdk
    jot
    jq # json processor
    jupyter
    kazam # screencast
    kdeconnect
    kdiff3 # until meld works properly
    lftp
    libertine
    # libmtp
    libreoffice
    libsForQt5.okular
    libsForQt5.spectacle # replaced ksnapshot
    libwacom
    libxml2 # for xmllint
    lsof
    lshw
    lxqt.lximage-qt
    lxqt.qterminal
    memtester
    midori # browser
    mkpasswd
    # mongodb
    # mongodb-tools
    # mtpfs
    mupdf
    ncompress
    nix-index # provides nix-locate
    nix-prefetch-git
    # nodePackages.mathjax # for gitit
    offlineimap
    openjdk
    opera
    p7zip
    pandoc
    pasystray # audio
    pavucontrol # audio
    pciutils # audio (lspci)
    pdfgrep
    pdfmod
    pdftk
    pkgconfig
    python
    # python2Env
    python3Env
    # pypi2nix
    qpdf
    qpdfview
    # rEnv
    rsync
    # sane-airscan
    # saxon # xslt
    # sage - broken
    # semantik
    shake # like make
    signal-desktop
    simplescreenrecorder
    # simple-scan
    # squirrel-sql
    # stack
    # stack2nix
    # syncthing
    sxiv
    tabula # extract tables from PDF files
    # tectonic
    telnet
    texstudio
    texlive.combined.scheme-full
    tree
    ugrep
    unrar
    unzip
    usbutils
    vistafonts # True-type fonts from MS Windows
    vivaldi # browser
    vlc
    wacomtablet
    # weka
    wget
    wpa_supplicant
    x11
    xf86_input_wacom
    xmlstarlet # A command line tool for manipulating and querying XML data
    xmonad-with-packages
    xorg.libX11
    xorg.libXft
    xorg.xev
    # xpdf # broken in 20.03
    # xsane
    xscreensaver
    xsel
    yq # for working with yaml files
    z3 # theorem proover
    zip
  ];
}
