{pkgs, ...}: {
  vim = {
    telescope = {
      enable = true;
      extensions = [
        {
          name = "fzf";
          packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
        }
        {
          name = "file_browser";
          packages = [pkgs.vimPlugins.telescope-file-browser-nvim];
        }
      ];
      setupOpts = {
        extensions = {
          fzf.fuzzy = true;
          file_browser = {
            hijack_netrw = true;
            hidden = {
              file_browser = true;
              folder_browser = true;
            };
          };
        };
      };
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
