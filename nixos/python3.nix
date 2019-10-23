{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python3.withPackages (ps: with ps; [
      csvkit
      gensim
      h5py
      hmmlearn
      ipython
      JayDeBeApi
      matplotlib
      networkx
      numpy
      pandas
      pycairo
      pydot
      pydotplus
      pygments
      pyqt5
      scikitlearn
      seaborn
    ]);
  };
}
