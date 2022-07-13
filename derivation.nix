{ lib, stdenv, mdbook, mdbook-mermaid }:

stdenv.mkDerivation {
  pname = "dvb-dump-docs";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [ mdbook mdbook-mermaid ];
  
  buildPhase = ''
    ${mdbook-mermaid}/bin/mdbook-mermaid install
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
