{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python36.withPackages (ps: with ps; [
      csvkit
      gensim
      h5py
      ipython
      JayDeBeApi
      matplotlib
      numpy
      pandas
      pydotplus
      pygments
      scikitlearn
      seaborn
    ]);
  };
}
