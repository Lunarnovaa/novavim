{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    mkNovavimPackage = inputs.lunarsLib.builders.mkNovavimPackage {
      inherit pkgs inputs;
      moduleDir = ../modules;
    };
  in {
    packages.aurabora = mkNovavimPackage {
      config.novavim = {
        languages = {
          astro.enable = true;
          css.enable = true;
          md.enable = true;
          nix.enable = true;
          ts.enable = true;
        };
      };
    };
  };
}
