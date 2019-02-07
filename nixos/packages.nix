pkgs:

with pkgs; [
  auctex
  bash
  binutils-unwrapped
  cabal2nix
  curl
  cvc4
  dmenu2
  docker
  dzen2
  # emacs
  (import ./emacs.nix { inherit pkgs; })
  firefox
  gcc
  getmail
  ghc
  ghostscript # for pdf2dsc
  gitAndTools.gitFull
  gnome3.dconf
  gnome3.dconf-editor
  gnome3.eog
  gnome3.gnome-disk-utility
  gnome3.meld
  gnumake
  gnupg
  haskellPackages.cabal-install
  # haskellPackages.packunused
  haskellPackages.pandoc-citeproc
  haskellPackages.template
  haskellPackages.stylish-haskell
  # haskellPackages.liquidhaskell
  # my-liquidhaskell
  haskellPackages.X11-xft
  hello-amy
  imagemagick
  jot
  kdeApplications.okular
  libreoffice
  lsof
  lxqt.qterminal
  nix-prefetch-git
  pandoc
  pdfmod
  pkgconfig
  python
  python3
  python36Packages.csvkit
  qpdf
  rEnv
  rsync
  # stack
  # stack2nix
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
  xscreensaver
  xsel
  wget
  z3
]
