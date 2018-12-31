{
  packageOverrides = super: let self = super.pkgs; in
  {
    haskellPackages = super.haskellPackages.override {
      overrides = self: super: {
        grid = self.callPackage ~/grid {};
      };
    };
  };
}