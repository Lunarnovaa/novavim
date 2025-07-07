{
  description = "Novavim: Lunarnova's Neovim Flake";

  outputs = inputs: let
    systems = import inputs.systems;
  in
    import ./. {
      inherit systems;
      inherit (inputs) lunarsLib nvf;

      pkgs = inputs.nixpkgs.legacyPackages.${systems};
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

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    lunarsLib = {
      url = "github:Lunarnovaa/LunarsLib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
