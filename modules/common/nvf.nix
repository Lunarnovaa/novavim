{lib, ...}: let
  # nvf for some reason sets theme stuff with mkDefault
  # so I make a slightly more prioritized mkDefault version
  # mkDefault = 1000, mkForce = 50
  mkMyDefault = lib.modules.mkOverride 900;
in {
  vim = {
    viAlias = true;
    vimAlias = true;

    theme = {
      enable = true;
      name = mkMyDefault "catppuccin";
      style = mkMyDefault "mocha";
    };

    lsp.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    options = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
    };
  };
}
