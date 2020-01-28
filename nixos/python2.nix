{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    pythonEnv = python2.withPackages (ps: with ps; [
      pandocfilters
      pygraphviz
    ]);
  };
}
