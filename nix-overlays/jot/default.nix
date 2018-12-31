{ mkDerivation, base, cmdargs, directory, fetchgit, filepath
, process, stdenv, time
}:
mkDerivation {
  pname = "jot";
  version = "1.3";
  src = fetchgit {
    url = "https://github.com/mhwombat/jot.git";
    sha256 = "0k6fjcasns7pa20iq2mqck3gn777vx42mnv11rnnzrbhkm8r3838";
    rev = "5f080b04df8b797035df326f1176047098556b08";
    fetchSubmodules = true;
  };
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base cmdargs directory filepath process time
  ];
  license = stdenv.lib.licenses.publicDomain;
}
