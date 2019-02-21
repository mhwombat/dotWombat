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
