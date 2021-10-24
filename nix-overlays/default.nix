self: super: {
  hello-amy = self.callPackage ./hello-amy {};
  jot = self.haskellPackages.callPackage ./jot {};
}
