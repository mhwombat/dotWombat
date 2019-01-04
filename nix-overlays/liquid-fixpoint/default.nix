{ mkDerivation, ansi-terminal, array, ascii-progress, async
, attoparsec, base, bifunctors, binary, boxes, bytestring, cereal
, cmdargs, containers, deepseq, directory, dotgen, fetchgit, fgl
, fgl-visualize, filemanip, filepath, ghc-prim, git, hashable
, intern, located-base, mtl, nettools, ocaml, parallel, parallel-io
, parsec, pretty, process, stdenv, stm, syb, tasty, tasty-ant-xml
, tasty-hunit, tasty-rerun, text, text-format, time, transformers
, unordered-containers, z3
}:
mkDerivation {
  pname = "liquid-fixpoint";
  version = "0.8.0.1";
  src = fetchgit {
    url = "https://github.com/ucsd-progsys/liquid-fixpoint.git";
    sha256 = "0j35a9692csm84zb5mizj24d4lr86fxznrjg8nww2ms5nr2g67dz";
    rev = "f3a7f69ba727f18261a6e1a5bd5d0a0098380d91";
    fetchSubmodules = true;
  };
  configureFlags = [ "-fbuild-external" ];
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    ansi-terminal array ascii-progress async attoparsec base bifunctors
    binary boxes bytestring cereal cmdargs containers deepseq directory
    dotgen fgl fgl-visualize filemanip filepath ghc-prim hashable
    intern located-base mtl parallel parallel-io parsec pretty process
    syb text text-format time transformers unordered-containers
  ];
  executableHaskellDepends = [ base ];
  executableSystemDepends = [ ocaml ];
  testHaskellDepends = [
    base containers directory filepath mtl process stm tasty
    tasty-ant-xml tasty-hunit tasty-rerun text transformers
  ];
  testSystemDepends = [ git nettools z3 ];
  doCheck = false;
  homepage = "https://github.com/ucsd-progsys/liquid-fixpoint";
  description = "Predicate Abstraction-based Horn-Clause/Implication Constraint Solver";
  license = stdenv.lib.licenses.bsd3;
}
