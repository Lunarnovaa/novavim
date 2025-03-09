{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./parts
      ];

      systems = import inputs.systems;
    };

  inputs = {
    systems = {
      url = "github:nix-systems/x86_64-linux";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # powers the config
    nvf = {
      url = "github:notashelf/nvf/v0.7";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        flake-utils.follows = "flake-utils";
      };
    };

    # powers my modularized flake
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    # included to unify inputs
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
  };
}
