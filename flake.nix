{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = {
          acme = pkgs.callPackage ./nix/acme.nix { };
          sam = pkgs.callPackage ./nix/sam.nix { };
        };
        formatter = pkgs.nixfmt-rfc-style;
        devShells.default = pkgs.mkShell.override {
          packages = with pkgs; [
            gnumake
          ];
        };
      }
    );
}
