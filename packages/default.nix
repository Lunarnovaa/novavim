{inputs, ...}: {
  imports = [
    ./novacademy.nix
    ./aurabora.nix
    ./lunarsLib.nix
    ./lunix.nix
  ];

  perSystem = {
    pkgs,
    self',
    ...
  }: let
    mkNovavimPackage = inputs.lunarsLib.builders.mkNovavimPackage {
      inherit pkgs inputs;
      moduleDir = ../modules;
    };
  in {
    packages.default = self'.packages.maximal;
    packages.maximal = mkNovavimPackage {
      config.novavim = {
        languages = {
          astro.enable = true;
          bash.enable = true;
          css.enable = true;
          md.enable = true;
          nix.enable = true;
          nu.enable = true;
          py.enable = true;
          ts.enable = true;
          typst.enable = true;
          yaml.enable = true;
        };
      };
    };
  };
}
