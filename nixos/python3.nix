{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python3.withPackages (ps: with ps; [
      csvkit
      gensim
      h5py
      hmmlearn
      ipython
      JayDeBeApi
      jupyter
      matplotlib
      networkx
      numpy
      pandas
      pomegranate
      pycairo
      pydot
      pydotplus
      pymc3
      pygments
      pyqt5
#      pyro-ppl
      pytorch
      scikitlearn
      seaborn
    ]);
  };
}
