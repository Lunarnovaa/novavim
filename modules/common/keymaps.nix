{...}: {
  vim.keymaps = [
    {
      key = "<leader>bt";
      mode = "n";
      silent = true;
      action = ":NvimTreeToggle<CR>";
    }
  ];
}
