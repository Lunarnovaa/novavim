{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = inputs: let
    inherit (inputs.lunarsLib.builders) mkNovavimPackage;

    systems = import inputs.systems;

    forAllSystems = function:
      inputs.nixpkgs.lib.genAttrs systems (
        system: function inputs.nixpkgs.legacyPackages.${system}
      );

    moduleDir = ./modules;
  in {
    packages = forAllSystems (pkgs: {
      default = inputs.self.packages.${pkgs.system}.maximal;
      maximal = mkNovavimPackage {
        inherit pkgs inputs moduleDir;
        languages = [
          "nix"
          "ts"
          "md"
        ];
      };
      nix = mkNovavimPackage {
        inherit pkgs inputs moduleDir;
        languages = ["nix"];
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
  };
}
