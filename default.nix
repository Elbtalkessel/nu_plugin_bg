{
  pkgs ? import <nixpkgs> { },
}:
let
  manifest = (pkgs.lib.importTOML ./Cargo.toml).package;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = manifest.name;
  inherit (manifest) version;
  cargoLock.lockFile = ./Cargo.lock;
  src = pkgs.lib.cleanSource ./.;
  meta = {
    description = "Nushell plugin that attempts to start programs in the background.";
    homepage = "https://github.com/fdncred/nu_plugin_bg";
    license = pkgs.lib.licenses.mit;
    mainProgram = "nu_plugin_bg";
  };
}
