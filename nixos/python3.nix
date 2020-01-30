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
      pandocfilters
      pip
      pomegranate
      pycairo
      pydot
      pydotplus
      pygraphviz
      pymc3
      pygments
      pyqt5
#      pyro-ppl
      pytorch
      scikitlearn
      seaborn
      virtualenvwrapper # for pip
    ]);
  };
}
