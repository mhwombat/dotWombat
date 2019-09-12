pkgs:

with pkgs; [
  # AgdaStdlib
  aspell
  aspellDicts.en
  aspellDicts.en-computers
  aspellDicts.en-science
  auctex
  bash
  bind # for dig
  binutils-unwrapped
  cabal2nix
  coq
  csvkit
  curl
  cvc4
  dbeaver
  # dbvisualizer
  dmenu2
  dmidecode
  docker
  dzen2
  (import ./emacs.nix { inherit pkgs; })
  file
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
  haskellPackages.pandoc-types
  haskellPackages.template
  haskellPackages.stylish-haskell
  # haskellPackages.liquidhaskell
  # my-liquidhaskell
  haskellPackages.X11-xft
  hdf5
  hdfview
  hello-amy
  # idris
  # idrisPackages.contrib
  imagemagick
  inkscape
  iosevka # font
  ispell
  jdk
  jot
  kdeApplications.okular
  kdeApplications.spectacle # replaced ksnapshot
  libertine
  libreoffice
  lsof
  lxqt.lximage-qt
  lxqt.qterminal
  mkpasswd
  ncompress
  nix-index # provides nix-locate
  nix-prefetch-git
  openjdk
  pandoc
  pdfmod
  pkgconfig
  python
  python3Env
  # pypi2nix
  qpdf
  rEnv
  rsync
  saxon # xslt
  squirrel-sql
  # stack
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
  xmonad-with-packages
  xorg.libX11
  xorg.xev
  xscreensaver
  xsel
  weka
  wget
  z3
]
