{ lib, stdenv, mdbook }:

stdenv.mkDerivation {
  pname = "dvb-dump-docs";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [ mdbook ];
  
  buildPhase = ''
    ${mdbook}/bin/mdbook build
  '';

  installPhase  = ''
    mkdir -p $out/bin/
    cp -r book/* $out/bin/
  '';

  meta = with lib; {
    description = "Documentation for DVB-Dump project";
    homepage = "https://github.com/dump-dvb/documentation";
  };
}
