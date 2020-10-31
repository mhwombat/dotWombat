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
    bind # for dig
    binutils-unwrapped
    bookworm
    cabal2nix
    cairo
    calibre
    conda # python package manager
    # coq
    csvkit
    curl
    cvc4
    dbeaver
    dmenu
    dmidecode
    docker
    dos2unix
    dzen2
    # elfutils # provides libdw
    (import ./emacs.nix { inherit pkgs; })
    fbreader
    file
    firefox
    fzy
    gcc
    gdb
    ghc
    ghostscript # for pdf2dsc
    gimp
    git-lfs
    gitAndTools.gitFull
    glabels
    gmp
    gnome3.dconf
    gnome3.dconf-editor
    gnome3.eog
    gnome3.gnome-disk-utility
    gnome3.gucharmap
    gnome3.meld
    gnumake
    gnupg
    gnutls
    gparted
    graphviz
    # grsync
    gvfs
    haskellPackages.cabal-install
    haskellPackages.niv
    # haskellPackages.packunused # broken
    haskellPackages.pandoc
    haskellPackages.pandoc-citeproc
    haskellPackages.pandoc-crossref
    haskellPackages.pandoc-types
    haskellPackages.template
    haskellPackages.stylish-haskell
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
    kdeApplications.okular
    kdeApplications.spectacle # replaced ksnapshot
    kdeconnect
    lftp
    libertine
    libmtp
    libreoffice
    lsof
    lxqt.lximage-qt
    lxqt.qterminal
    memtester
    mkpasswd
    # mongodb
    # mongodb-tools
    mtpfs
    ncompress
    nix-index # provides nix-locate
    nix-prefetch-git
    offlineimap
    openjdk
    p7zip
    pandoc
    pasystray # audio
    pavucontrol # audio
    pdfmod
    pdftk
    pkgconfig
    python
    # python2Env
    python3Env
    # pypi2nix
    qpdf
    # rEnv
    rsync
    # sane-airscan
    saxon # xslt
    signal-desktop
    # simple-scan
    squirrel-sql
    stack
    # stack2nix
    # syncthing
    sxiv
    tabula
    tectonic
    telnet
    texstudio
    texlive.combined.scheme-full
    tree
    unrar
    unzip
    vistafonts # True-type fonts from MS Windows
    vlc
    x11
    xmlstarlet
    xmonad-with-packages
    xorg.libX11
    xorg.xev
    # xpdf # broken in 20.03
    # xsane
    xscreensaver
    xsel
    weka
    wget
    wpa_supplicant
    z3
    zip
  ];
}
