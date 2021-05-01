{ pkgs, todomvc }:
(pkgs.makeRustPlatform {
  rustc = todomvc.nix.rustOverlay;
  cargo = todomvc.nix.rustOverlay;
}).buildRustPackage rec {
  pname = "rust-backend";
  version = "0.1.0";
  src = ../../rust;
  cargoSha256 = "sha256-vYq3P/AnuKFq0JvMnXwXQQoL7O8YGhMYSmHU6j4NGME=";
  doCheck = false;
  cargoBuildFlags = [ "-p" pname ];

  # Needed to get openssl-sys to use pkgconfig.
  OPENSSL_NO_VENDOR = 1;

  nativeBuildInputs = with pkgs; [ zlib pkgconfig ];
  buildInputs = with pkgs; [ openssl openssl.dev ];
}
