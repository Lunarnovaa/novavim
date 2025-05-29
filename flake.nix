{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = inputs: let
    inherit (inputs.lunarsLib.builders) mkNovavimPackage;

    # Just moves some boilerplate to my extended library.
    # inputs.systems is applied to a genAttrs function.
    forAllSystems = inputs.lunarsLib.systems.forAllSystems inputs;

    moduleDir = ./modules;
  in {
    packages = forAllSystems (pkgs: {
      default = inputs.self.packages.${pkgs.system}.maximal;
      maximal = mkNovavimPackage {
        inherit pkgs inputs moduleDir;
        languages = [
          "nix"
          "md"
          "nu"
          "python"
          "ts"
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
