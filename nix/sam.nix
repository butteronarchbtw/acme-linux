{pkgs, lib, stdenv, ...}:
stdenv.mkDerivation {
    name = "sam";
    src = lib.cleanSource ../.;
    buildInputs = with pkgs; [
        gnumake
        libX11
        libXt
        fontconfig
    ];
    configurePhase = ''
        patchShebangs ./configure
        ./configure sam
    '';
    buildPhase = ''
        make -j`nproc`
    '';
    installPhase = ''
        mkdir -p $out
        make prefix=$out install
    '';
}
