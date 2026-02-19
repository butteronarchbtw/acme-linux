{pkgs, lib, stdenv, ...}:
stdenv.mkDerivation {
    name = "acme";
    src = lib.cleanSource ../.;
    buildInputs = with pkgs; [
        gnumake
        libX11
        libXt
        fontconfig
    ];
    configurePhase = ''
        patchShebangs ./configure
        ./configure acme
    '';
    buildPhase = ''
        make -j`nproc`
    '';
    installPhase = ''
        mkdir -p $out
        make prefix=$out install
    '';
}
