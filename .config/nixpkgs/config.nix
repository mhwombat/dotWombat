{
  allowUnfree = true;

  packageOverrides = super: let self = super.pkgs; in
  {
    haskellPackages = super.haskellPackages.override {
      overrides = self: super: {
        gray-extended = self.callPackage ~/x/gray-extended {};
        grid = self.callPackage ~/x/grid {};
        som = self.callPackage ~/x/som {};
        creatur = self.callPackage ~/x/creatur {};
        creatur-wains = self.callPackage ~/x/creatur-wains {};
        creatur-wains-test-utils = self.callPackage ~/x/creatur-wains-test-utils {};
        creatur-dvector-wains = self.callPackage ~/x/creatur-dvector-wains {};
      };
    };
  };
}