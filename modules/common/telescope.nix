{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.lists) singleton;
in {
  vim = {
    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf.fuzzy = true;};
        }
        {
          name = "undo";
          packages = [pkgs.vimPlugins.telescope-undo-nvim];
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>fu";
        mode = "n";
        action = ":Telescope undo<CR>";
        desc = "Undo [Telescope]";
      }
    ];
  };
}
