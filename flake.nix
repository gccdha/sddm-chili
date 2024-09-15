{
  description = "Chili SDDM theme by MarianArlt";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, ... }:
  let
    version = builtins.substring 0 8 self.lastModifiedDate;
    eachSystem = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
    ];

  in
  {
    packages = eachSystem (system: {
      sddm-chili = nixpkgs.legacyPackages.${system}.callPackage ./sddm-chili.nix { inherit version; };
    });
    defaultPackage = eachSystem (system: self.packages.${system}.sddm-chili);
  };
}
