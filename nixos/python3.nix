{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python3.withPackages (ps: with ps; [
      # black
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
      pylint
      pymc3
      pygments
      pyqt5
#      pyro-ppl
      pytorch
      scikitlearn
      seaborn
      setuptools
      virtualenvwrapper # for pip
    ]);
  };
}
