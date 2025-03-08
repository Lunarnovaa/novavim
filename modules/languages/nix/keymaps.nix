{...}: {
  vim.keymaps = [
    {
      key = "<leader>fmt";
      mode = "n";
      action = ":! nix fmt .";
      desc = "Format file tree with 'nix fmt'";
    }
  ];
}