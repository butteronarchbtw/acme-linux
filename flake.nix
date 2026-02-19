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
        packages = rec {
          acme = pkgs.callPackage ./nix/acme.nix { inherit plan9tools; };
          sam = pkgs.callPackage ./nix/sam.nix { inherit plan9tools; };
          plan9tools = pkgs.callPackage ./nix/plan9tools.nix { };
        };
        formatter = pkgs.nixfmt-rfc-style;
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            gnumake
            libX11
            libXt
            fontconfig
          ];
        };
      }
    );
}
