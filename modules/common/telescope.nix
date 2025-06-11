{pkgs, ...}: {
  vim = {
    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
          setup = {fzf = {fuzzy = true;};};
        }
        {
          name = "file-browser";
          packages = [pkgs.vimPlugins.telescope-file-browser-nvim];
          setup = {file_browser = {hijack_netrw = true;};};
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>fd";
        mode = "n";
        silent = true;
        # Open file browser with path of current buffer
        action = ":Telescope file_browser path=%:p:h select_buffer=true<CR>";
        desc = "Directory [Telescope]";
      }
    ];
  };
}
