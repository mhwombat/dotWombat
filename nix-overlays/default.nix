self: super: {
  hello-amy = super.callPackage ./hello-amy {};
  jot = super.haskellPackages.callPackage ./jot {};
  liquid-fixpoint = super.haskellPackages.callPackage ./liquid-fixpoint {};
  liquidhaskell = super.haskellPackages.callPackage ./liquidhaskell {};
}
