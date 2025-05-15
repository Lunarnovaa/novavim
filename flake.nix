{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    inherit (inputs.lunarsLib.builders) mkNovavimPackage;

    systems = import inputs.systems;

    forAllSystems = function:
      nixpkgs.lib.genAttrs
      systems
      (system: function nixpkgs.legacyPackages.${system});

    packages = nixpkgs.lib.genAttrs systems (system: packages.${system});

    moduleDir = ./modules;
  in {
    packages = forAllSystems (pkgs: {
      #default = packages.maximal;
      maximal = mkNovavimPackage {
        inherit pkgs inputs moduleDir;
        languages = [
          "nix"
          "ts"
          "md"
        ];
      };
      writing = mkNovavimPackage {
        inherit pkgs inputs moduleDir;
        languages = [
          "md"
        ];
      };
    });

    formatter = forAllSystems (pkgs: pkgs.alejandra);
  };

  inputs = {
    systems = {
      url = "github:nix-systems/x86_64-linux";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # powers the config
    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        flake-utils.follows = "flake-utils";
      };
    };

    lunarsLib = {
      url = "github:Lunarnovaa/LunarsLib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # included to unify inputs
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
  };
}
