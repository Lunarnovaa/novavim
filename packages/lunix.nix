{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    mkNovavimPackage = inputs.lunarsLib.builders.mkNovavimPackage {
      inherit pkgs inputs;
      moduleDir = ../modules;
    };
  in {
    packages.lunix = mkNovavimPackage {
      config.novavim = {
        languages = {
          css.enable = true;
          md.enable = true;
          nix.enable = true;
          nu.enable = true;
          ts.enable = true;
        };
      };
    };
  };
}
