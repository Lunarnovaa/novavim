{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    mkNovavimPackage = inputs.lunarsLib.builders.mkNovavimPackage {
      inherit pkgs inputs;
      moduleDir = ../modules;
    };
  in {
    # This is a super-minimal packaging of Novavim that only does the bare minimum that is needed for my Lunix install process.
    packages.lunix-install = mkNovavimPackage {
      config.novavim = {
        languages.nix.enable = true;
      };
    };
  };
}
