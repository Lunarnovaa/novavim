{lib}: let
  inherit (lib.lists) flatten;
in {
  mkNovavimPackage = {
    pkgs,
    inputs,
    languages ? ["nix"],
  }: let
    top = ../../.;
    moduleDir = top + /modules;
  in
    (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = flatten [
        (moduleDir + /common)
        (moduleDir + /options)
        (map (lang: (moduleDir + /languages + /${lang})) languages)
      ];
    })
    .neovim;
}
