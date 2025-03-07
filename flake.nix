{
  description = "Novavim: Lunarnova's Neovim Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf/v0.7";

    };

    systems = {
      url = "github:nix-systems/x86_64-linux";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let 
    #systems = import inputs.systems;
    #forAllSystems = nixpkgs.lib.genAttrs systems;
    #pkgs = forAllSystems (system: nixpkgs.legacyPackages.${system});
    #packages' = forAllSystems (system: "packages"."${system}");
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [./modules];
    })
    .neovim;
  };

}