{
  description = "Chili SDDM theme by MarianArlt";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = { self, nixpkgs, systems, ... }:
  let
    version = builtins.substring 0 8 self.lastModifiedDate;
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in
  {
    packages = eachSystem (system: {
      sddm-chili = nixpkgs.legacyPackages.${system}.callPackage ./sddm-chili.nix { inherit version; };
    });
    defaultPackage = eachSystem (system: self.packages.${system}.sddm-chili);
  };
}
