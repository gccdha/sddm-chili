{ nixpkgs ? import <nixpkgs> {}, ...}:
nixpkgs.callPackage ./sddm-chili.nix { version = "unknown"; }
