{inputs, ...}: {
  perSystem = {
    pkgs,
    lunarLib,
    ...
  }: let
    inherit (lunarLib.builders) mkNovavimPackage;
  in {
    packages.maximal = mkNovavimPackage {
      inherit pkgs inputs;
      languages = [
        "nix"
        "ts"
        "md"
      ];
    };
  };
}
