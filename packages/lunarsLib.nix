{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    mkNovavimPackage = inputs.lunarsLib.builders.mkNovavimPackage {
      inherit pkgs inputs;
      moduleDir = ../modules;
    };
  in {
    packages.lunarsLib = mkNovavimPackage {
      config.novavim = {
        languages = {
          md.enable = true;
          nix.enable = true;
        };
      };
    };
  };
}
