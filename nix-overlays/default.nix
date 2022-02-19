self: super: {
  hello-amy = self.callPackage ./hello-amy {};
  jot = self.haskellPackages.callPackage ./jot {};
  pandoc-select-code = self.haskellPackages.callPackage ./pandoc-select-code {};
}
