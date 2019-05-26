pkgs:

with pkgs; [
  auctex
  bash
  bind # for dig
  binutils-unwrapped
  cabal2nix
  curl
  cvc4
  dbeaver
  dmenu2
  dmidecode
  docker
  dzen2
  (import ./emacs.nix { inherit pkgs; })
  firefox
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
  xscreensaver
  xsel
  weka
  wget
  z3
]
