{stdenv}: 
stdenv.mkDerivation {
  name = "dump-dvb-docs-sources";

  src = ./.;

  installPhase = ''
    mkdir -p $out/source
    cp -r ./ $out/source/
  '';
}
