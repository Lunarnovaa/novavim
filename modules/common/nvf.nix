{
  vim = {
    viAlias = true;
    vimAlias = true;

    # Keybinds & Options
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    options = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      tabstop = 2;
      shiftwidth = 2;
    };

    spellcheck.enable = true;

    lsp = {
      enable = true;

      formatOnSave = true;
      lightbulb.enable = true;
      trouble.enable = true;
      nvim-docs-view.enable = true;
    };

    autopairs.nvim-autopairs = {
      enable = true;
    };

    autocomplete.blink-cmp.enable = true;

    snippets.luasnip = {
      enable = true;
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
      hardtime-nvim = {
        enable = true;
        setupOpts = {
          disabled_keys = {
            "<Up>" = [];
            "<Left>" = [];
            "<Down>" = [];
            "<Right>" = [];
          };
        };
      };
    };

    utility = {
      diffview-nvim.enable = true;
      yanky-nvim = {
        enable = true;
        setupOpts.ring.storage = "sqlite";
      };
      motion.leap.enable = true;
    };

    notes = {
      todo-comments.enable = true;
    };

    comments.comment-nvim.enable = true;
  };
}
