{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python36.withPackages (ps: with ps; [
      csvkit
      ipython
      matplotlib
      numpy
      pandas
    ]);
  };
}

# with pkgs;
# let
#   my-python-packages = python-packages: with python-packages; [
#     csvkit
#     ipython
#     numpy
#     pandas
#   ]; 
#   python3Env = python3.withPackages my-python-packages;
# in ...



# {
#     nixpkgs.config.packageOverrides = super: let self = super.pkgs; in
#     {
#         rEnv = super.rWrapper.override {
#             packages = with self.rPackages; [
#                 ade4
#                 caret
#                 factoextra
#                 FactoMineR
#                 ggcorrplot
#                 ggplot2
#                 lubridate
#                 missMDA
#                 mlbench
#                 paran
#                 pcaMethods
#                 reshape2
#                 tidyverse
#                 xts
#                ];
#         };
#     };
# }


# { # ...

#   environment.systemPackages = with pkgs; [
#     (python35.withPackages(ps: with ps; [ numpy toolz ]))
#   ];
# }
