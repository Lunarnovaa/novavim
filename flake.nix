{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./packages];

      systems = import inputs.systems;

      perSystem = {pkgs, ...}: {formatter = pkgs.alejandra;};
    };

  inputs = {
    # powers the config
    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    systems.url = "github:nix-systems/x86_64-linux";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lunarsLib = {
      url = "github:Lunarnovaa/LunarsLib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
