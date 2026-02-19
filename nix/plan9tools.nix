{pkgs, lib, stdenv, ...}:
stdenv.mkDerivation {
    name = "plan9tools";
    src = lib.cleanSource ../.;
    buildInputs = with pkgs; [
        gnumake
        libX11
        libXt
        fontconfig
    ];
    configurePhase = ''
        patchShebangs ./configure
        ./configure tools
    '';
    buildPhase = ''
        make -j`nproc`
    '';
    installPhase = ''
        mkdir -p $out
        make prefix=$out install
    '';
}
