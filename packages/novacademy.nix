{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    mkNovavimPackage = inputs.lunarsLib.builders.mkNovavimPackage {
      inherit pkgs inputs;
      moduleDir = ../modules;
    };
  in {
    packages.novacademy = mkNovavimPackage {
      config.novavim = {
        languages = {
          typst.enable = true;
          yaml.enable = true;
        };
      };
    };
  };
}
