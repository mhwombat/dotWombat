self: super: {
  hello-amy = super.callPackage ./hello-amy {};
  jot = super.haskellPackages.callPackage ./jot {};
}
