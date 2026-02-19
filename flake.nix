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
          acme = pkgs.symlinkJoin {
            name = "acme";
            paths = [
              (pkgs.callPackage ./nix/acme.nix { })
              plan9tools
            ];
          };
          sam = pkgs.symlinkJoin {
            name = "sam";
            paths = [
              (pkgs.callPackage ./nix/sam.nix { })
              plan9tools
            ];
          };
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
