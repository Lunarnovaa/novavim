{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = inputs: let
    inherit (inputs.lunarsLib.importers) listNixRecursive;
    mkFlake = inputs.flake-parts.lib.mkFlake {inherit inputs;};
  in
    mkFlake {
      imports = listNixRecursive ./packages;
      systems = import inputs.systems;
      perSystem = {pkgs, ...}: {formatter = pkgs.alejandra;};
    };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    lunarsLib = {
      url = "github:Lunarnovaa/LunarsLib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    systems.url = "github:nix-systems/x86_64-linux";
  };
}
