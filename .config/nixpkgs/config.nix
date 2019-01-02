{
  packageOverrides = super: let self = super.pkgs; in
  {
    haskellPackages = super.haskellPackages.override {
      overrides = self: super: {
        grid = self.callPackage ~/x/grid {};
        # grid = self.callPackage ~/x/som {};
        # grid = self.callPackage ~/x/creatur {};
        # grid = self.callPackage ~/x/creatur-wains {};
        # grid = self.callPackage ~/x/creatur-wains-test-utils {};
        # grid = self.callPackage ~/x/creatur-dvector-wains {};
      };
    };
  };
}