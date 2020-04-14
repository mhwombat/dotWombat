{ config, pkgs, options, ... }:

with pkgs;
{

  nixpkgs.overlays = [
    (import /home/amy/nix-overlays/default.nix)
  ];


  # Packages I want to use
  environment.systemPackages = [
  # AgdaStdlib
  aspell
  aspellDicts.en
  aspellDicts.en-computers
  aspellDicts.en-science
  auctex
  autoconf # for building GHC
  automake # for building GHC
  bash
  bind # for dig
  binutils-unwrapped
  cabal2nix
  cairo
  conda # python package manager
  coq
  csvkit
  curl
  cvc4
  dbeaver
  # dbvisualizer
  # dmenu2
  dmenu
  dmidecode
  docker
  dzen2
  elfutils # provides libdw
  (import ./emacs.nix { inherit pkgs; })
  # epdfview
  # evince
  file
  firefox
  fzy
  gcc
  getmail
  ghc
  ghostscript # for pdf2dsc
  git # for building GHC
  gitAndTools.gitFull
  glibcLocales # for building GHC
  gmp
  gmp.dev # for building GHC
  gmp.out # for building GHC
  gnome3.dconf
  gnome3.dconf-editor
  gnome3.eog
  gnome3.gnome-disk-utility
  # gnome3.gnome-screenshot
  gnome3.gucharmap
  gnome3.meld
  gnumake
  gnupg
  graphviz
  # haskellPackages.Agda
  haskellPackages.cabal-install
  # haskellPackages.packunused
  # haskellPackages.hat
  haskellPackages.pandoc
  haskellPackages.pandoc-citeproc
  haskellPackages.pandoc-crossref
  haskellPackages.pandoc-types
  haskellPackages.template
  # haskellPackages.stylish-haskell - broken in 20.03
  # haskellPackages.liquidhaskell
  # my-liquidhaskell
  haskellPackages.X11-xft
  hdf5
  hdfview
  hello-amy
  # hevea
  # idris
  # idrisPackages.contrib
  imagemagick
  inkscape
  iosevka # font
  ispell
  jdk
  jot
  jq
  jupyter
  kdeApplications.okular
  kdeApplications.spectacle # replaced ksnapshot
  # latex2html
  lftp
  libertine
  libreoffice
  # libxml2 # for LaTeXML
  # libxslt # for LaTeXML
  lsof
  lxqt.lximage-qt
  lxqt.qterminal
  lzma # xz-utils, for GHC
  m4 # for building GHC
  mkpasswd
  mongodb
  mongodb-tools
  ncompress
  ncurses.dev # for building GHC
  ncurses.out # for building GHC
  nix-index # provides nix-locate
  nix-prefetch-git
  openjdk
  pandoc
  pdfmod
  pdftk
  perl # for building GHC
  # perl530Packages.Appcpanminus # for LaTeXML
  # perl530Packages.ParseRecDescent # for LaTeXML
  pkgconfig
  python
  # python2Env
  python3Env
  # pypi2nix
  qpdf
  rEnv
  rsync
  saxon # xslt
  squirrel-sql
  stack
  # stack2nix
  sxiv
  tectonic
  telnet
  texstudio
  texlive.combined.scheme-full
  tree
  unison
  unzip
  vistafonts # True-type fonts from MS Windows
  vlc
  x11
  xlibs.lndir # for building GHC
  xmlstarlet
  xmonad-with-packages
  xorg.libX11
  xorg.xev
  # xpdf # for pdftotext - broken in 20.03
  xscreensaver
  xsel
  weka
  wget
  which # for building GHC
  z3
  zip
  zlib.dev # for building GHC
  zlib.out # for building GHC
];
}
