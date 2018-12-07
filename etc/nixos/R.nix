/*
A nix expression to build R with the packages I use.

To install into your user profile:

    nix-env -f "<nixpkgs>" -iA rEnv

The set of available libraries can be discovered by running the command

    nix-env -f "<nixpkgs>" -qaP -A rPackages

The first column from that output is the name that has to be passed to
rWrapper.
*/
{
    packageOverrides = super: let self = super.pkgs; in
    {

        rEnv = super.rWrapper.override {
            packages = with self.rPackages; [
                ggplot2
		lubridate
                reshape2
                tidyverse
		xts
                ];
        };
    };
}
