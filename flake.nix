{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  };

  outputs = { self, nixpkgs, ... }:
  let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      package = pkgs.callPackage ./derivation.nix { };
  in rec {
    checks = packages;
    packages."${system}".dvb-dump-docs = package;
    defaultPackage."${system}" = package;
    overlay = (final: prev: {
      dvb-dump-docs = package;
    });
  };
}
