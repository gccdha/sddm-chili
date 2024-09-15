{
  description = "Chili SDDM theme by MarianArlt";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = inputs @ { self, nixpkgs, ... }: 
  let
    lib = nixpkgs.lib;
    genSystems = lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
    ];

  in
  {
    packages = genSystems (system: {
      sddm-chili = nixpkgs.legacyPackages.${system}.callPackage ./sddm-chili.nix;
    });
    defaultPackage = genSystems (system: self.packages.${system}.sddm-chili);
  };
}
