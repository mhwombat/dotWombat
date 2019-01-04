{ mkDerivation, aeson, array, base, bifunctors, binary, bytestring
, Cabal, cereal, cmdargs, containers, data-default, deepseq, Diff
, directory, exceptions, fetchgit, filepath, fingertree, ghc
, ghc-boot, ghc-paths, ghc-prim, gitrev, hashable, hpc, hscolour
, liquid-fixpoint, located-base, mtl, optparse-applicative
, optparse-simple, parsec, pretty, process, QuickCheck, stdenv, stm
, syb, tagged, tasty, tasty-ant-xml, tasty-hunit, tasty-rerun
, template-haskell, temporary, text, text-format, th-lift, time
, transformers, unordered-containers, vector, z3
}:
mkDerivation {
  pname = "liquidhaskell";
  version = "0.8.4.0";
  src = fetchgit {
    url = "https://github.com/ucsd-progsys/liquidhaskell.git";
    sha256 = "1z31qjgrx1bbcb05jl7a1bjj12pzddmskg2ycmj2ix9cr63grv8j";
    rev = "57213512a9d69093c12d644b21dbf9da95811894";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    aeson array base bifunctors binary bytestring Cabal cereal cmdargs
    containers data-default deepseq Diff directory exceptions filepath
    fingertree ghc ghc-boot ghc-paths ghc-prim gitrev hashable hpc
    hscolour liquid-fixpoint located-base mtl optparse-simple parsec
    pretty process QuickCheck syb template-haskell temporary text
    text-format th-lift time transformers unordered-containers vector
  ];
  executableHaskellDepends = [
    base cmdargs deepseq ghc ghc-boot hpc liquid-fixpoint located-base
    pretty process time
  ];
  testHaskellDepends = [
    array base bytestring containers directory filepath ghc ghc-boot
    hpc liquid-fixpoint mtl optparse-applicative parsec process stm syb
    tagged tasty tasty-ant-xml tasty-hunit tasty-rerun template-haskell
    text time transformers
  ];
  testSystemDepends = [ z3 ];
  homepage = "https://github.com/ucsd-progsys/liquidhaskell";
  description = "Liquid Types for Haskell";
  license = stdenv.lib.licenses.bsd3;
}
