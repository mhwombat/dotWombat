{ mkDerivation, base, cmdargs, directory, filepath, process, stdenv
, time
}:
mkDerivation {
  pname = "Jot";
  version = "1.2";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cmdargs directory filepath process time
  ];
  license = stdenv.lib.licenses.publicDomain;
}
