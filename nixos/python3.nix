{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python3Env = python3.withPackages (ps: with ps; [
      csvkit
      # jupyterlab
      numpy
      pandas
      pandocfilters
      pygraphviz
      pylint
      scikitlearn
      seaborn
    ]);
  };
}
