{...}: {
  config.vim = {
    lsp = {
      enable = true;
    };

    languages = {
      nix = {
        enable = true;
        format.enable = true; #defaults to alejandra
        lsp = {
          enable = true;
          #package = pkgs.nixd;
          #server = "nixd";
        };
        treesitter.enable = true;
      };
      markdown = {
        enable = true;
        format.enable = true; #defaults to deno
        lsp.enable = true; #defaults to marksman
        treesitter.enable = true;
      };
      ts = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
