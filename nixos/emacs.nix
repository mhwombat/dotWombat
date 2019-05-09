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
    async                    # needed by helm
    # counsel                  # includes ivy and swiper
    lv                       # hints for hydra
    haskell-mode             # Haskell editing mode
    helm                     # incremental completion
    # flycheck                 # On-the-fly syntax checking
    # pos-tip                  # tooltips
    # popup                    # popup tooltips and menus
    # button-lock              # clickable text
    # flycheck-color-mode-line # Change mode line colour with flycheck status
    hydra                    # key binding families
    fill-column-indicator    # show fill column
    nix-mode                 # Nix editing mode
    popup                    # needed by helm
  ]) ++ (with epkgs.melpaPackages; [
    helm-idris               # Idris doc search using Helm
    idris-mode               # Idris editing mode
    # intero                   # Haskell development mode
    markdown-mode
    ess
    # flycheck-liquidhs        # liquidhaskell flycheck
    # liquid-types             # show inferred liquid-types
  ]) ++ (with epkgs.elpaPackages; [
    auctex         # ; LaTeX mode
  ]) ++ [
    # nothing from main packages set
  ])
