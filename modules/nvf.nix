{pkgs, ...}: {
  config.vim = {
    viAlias = true;
    vimAlias = true;

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

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

    filetree.neo-tree = {
      enable = true;
    };
    git = {
      enable = true;
    };
    autopairs = {
      nvim-autopairs.enable = true;
    };
    keymaps = [
      {
        key = "<leader>fm";
        mode = ["n"];
        action = "<cmd>${pkgs.alejandra}/bin/alejandra .<CR>";
      }
    ];
  };
}
