/*
This is a nix expression to build Emacs and some Emacs packages I like
from source on any distribution where Nix is installed. This will install
all the dependencies from the nixpkgs repository and build the binary files
without interfering with the host distribution.

To build the project, type the following from the current directory:

  nix-build emacs.nix

To run the newly compiled executable:

  ./result/bin/emacs

To find out what packages are available for Emacs:

  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.elpaPackages
  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.melpaPackages
  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.melpaStablePackages
  nix-env -f "<nixpkgs>" -qaP -A emacsPackagesNg.orgPackages

*/
{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    lv                       # hints for hydra
    haskell-mode             # Haskell editing mode
    hydra                    # key binding families
    fill-column-indicator    # show fill column
  ]) ++ (with epkgs.melpaPackages; [
    # ample-theme               # Dark-ish theme
    # async                    # needed by helm
    # atom-one-dark-theme      # Dark-ish theme
    blacken                  # Python editing mode
    # ess
    # helm                     # incremental completion
    # helm-idris               # Idris doc search using Helm
    # idris-mode               # Idris editing mode
    jazz-theme               # Dark-ish theme
    # material-theme           # Dark-ish theme
    monokai-theme            # Dark-ish theme
    markdown-mode            # Markdown editing mode
    nix-mode                 # Nix editing mode
    # pandoc-mode              # Pandoc editing mode
    # popup                    # popup tooltips and menus; needed by helm
    # proof-general            # for use with Coq
    # zenburn-theme            # Dark-ish theme
  ]) ++ (with epkgs.elpaPackages; [
    # auctex                   # LaTeX mode
  ]) ++ [
    # nothing from main packages set
  ])
