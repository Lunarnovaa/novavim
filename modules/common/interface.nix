{
  # UI Elements
  vim = {
    tabline.nvimBufferline.enable = true;

    treesitter.context.enable = true;

    minimap.codewindow.enable = true;

    dashboard.alpha = {
      enable = true;
      theme = "theta";
    };

    notify.nvim-notify.enable = true;

    ui = {
      borders = {
        enable = true;
        globalStyle = "rounded";
      };
      noice.enable = true;
      colorizer.enable = true;
      illuminate.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          nix = "110";
          md = "80";
        };
      };
    };

    terminal.toggleterm = {
      enable = true;
      #setupOpts.direction = "float";
      lazygit = {
        enable = true;
      };
    };
    # Cosmetics
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };
  };
}
