{
  nixpkgs.config.packageOverrides = pkgs: with pkgs; {
    python2Env = python2.withPackages (ps: with ps; [
      pandocfilters
      pygraphviz
    ]);
  };
}
