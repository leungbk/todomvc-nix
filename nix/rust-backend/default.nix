{ pkgs, todomvc }:
(pkgs.makeRustPlatform {
  rustc = todomvc.nix.rustOverlay;
  cargo = todomvc.nix.rustOverlay;
}).buildRustPackage rec {
  pname = "rust-backend";
  version = "0.1.0";
  src = ../../rust;
  cargoSha256 = "sha256-0Fz+jJZ59PHka/jY3s5vcuGL85lvKs6p3PwY6T7Myrk=";
  doCheck = false;
  cargoBuildFlags = [ "-p" pname ];

  # Needed to get openssl-sys to use pkgconfig.
  OPENSSL_NO_VENDOR = 1;

  nativeBuildInputs = with pkgs; [ zlib pkgconfig ];
  buildInputs = with pkgs; [ openssl openssl.dev ];
}
