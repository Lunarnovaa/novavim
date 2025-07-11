{
  vim = {
    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        explorer = {
          enabled = true;
          replace_netrw = true;
        };
        image.enabled = true;
      };
    };
    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        action = "function() Snacks.explorer() end";
        lua = true;
      }
    ];
  };
}
