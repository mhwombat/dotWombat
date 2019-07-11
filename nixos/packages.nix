pkgs:

with pkgs; [
  AgdaStdlib
  auctex
  bash
  bind # for dig
  binutils-unwrapped
  cabal2nix
  coq
  curl
  cvc4
  dbeaver
  # dbvisualizer
  dmenu2
  dmidecode
  docker
  dzen2
  (import ./emacs.nix { inherit pkgs; })
  firefox
  flameshot
  fzy
  gcc
  getmail
  ghc
  ghostscript # for pdf2dsc
  gitAndTools.gitFull
  gmp
  gnome3.dconf
  gnome3.dconf-editor
  gnome3.eog
  gnome3.gnome-disk-utility
  gnome3.gucharmap
  gnome3.meld
  gnumake
  gnupg
  graphviz
  haskellPackages.Agda
  haskellPackages.cabal-install
  # haskellPackages.packunused
  # haskellPackages.hat
  haskellPackages.pandoc
  haskellPackages.pandoc-citeproc
  haskellPackages.pandoc-types
  haskellPackages.template
  haskellPackages.stylish-haskell
  # haskellPackages.liquidhaskell
  # my-liquidhaskell
  haskellPackages.X11-xft
  hdf5
  hdfview
  hello-amy
  idris
  idrisPackages.contrib
  imagemagick
  inkscape
  iosevka # font
  ispell
  jdk
  jot
  kdeApplications.okular
  libertine
  libreoffice
  lsof
  lxqt.lximage-qt
  lxqt.qterminal
  mkpasswd
  nix-prefetch-git
  openjdk
  pandoc
  pdfmod
  pkgconfig
  python
  python3Env
  pypi2nix
  qpdf
  rEnv
  rsync
  squirrel-sql
  # stack
  # stack2nix
  sxiv
  tectonic
  texstudio
  texlive.combined.scheme-full
  tree
  unison
  unzip
  vlc
  x11
  xmonad-with-packages
  xorg.libX11
  xorg.xev
  xscreensaver
  xsel
  weka
  wget
  z3
]
