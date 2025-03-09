{lib,...}: let
  lunarLib = {
    builders = import ./builders.nix {inherit lib;};
  };
in {
  perSystem = {_module.args = {inherit lunarLib;};};
  flake = {inherit lunarLib;};
}
