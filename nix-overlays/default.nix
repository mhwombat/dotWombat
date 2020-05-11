self: super: {
  hello-amy = self.callPackage ./hello-amy {};
  jot = self.haskellPackages.callPackage ./jot {};

  # unison-248 = super.ocamlPackages.callPackage ./unison-248 {};

  # haskellPackages.liquid-fixpoint = self.haskell.packages.ghc843.callPackage ./liquid-fixpoint {};
  # haskellPackages.liquidhaskell = self.haskell.packages.ghc843.callPackage ./liquidhaskell {};

  # lh-packages = self.haskell.packages.ghc843.extend(h-sel: h-sup: { liquid-fixpoint = h-sel.callPackage ./liquid-fixpoint {}; });
  # my-liquidhaskell = self.lh-packages.callPackage ./liquidhaskell {};

  # lh-packages = self.haskellPackages.extend(h-sel: h-sup: { liquid-fixpoint = h-sel.callPackage /home/amy/liquid-fixpoint {}; });
  # my-liquidhaskell = self.lh-packages.callPackage /home/amy/liquidhaskell {};
}
