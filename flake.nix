{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  };

  outputs = { self, nixpkgs, ... }:
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      package = pkgs.callPackage ./derivation.nix { };
      sources = pkgs.callPackage ./raw_sources.nix { };
  in rec {
    checks = packages;
    packages."${system}" = {
      dvb-dump-markdown = sources;
      dvb-dump-docs = package;
      default = package;
    };
    overlays.default = (final: prev: {
      dvb-dump-docs = package;
      dvb-dump-markdown = sources;
    });
  };
}
