{...}: {
  vim.languages.nix = {
    enable = true;
    format.enable = true; #defaults to alejandra
    lsp = {
      enable = true;
      #package = pkgs.nixd;
      #server = "nixd";
    };
    treesitter.enable = true;
  };
}
