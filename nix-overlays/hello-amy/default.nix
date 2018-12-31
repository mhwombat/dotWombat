{ gcc, coreutils, bash }:
derivation {
  name = "hello-amy";
  version = "1.1";
  builder = "${bash}/bin/bash";
  args = [ ./simple_builder.sh ];
  inherit gcc coreutils;
  src = ./simple.c;
  system = builtins.currentSystem;
}
