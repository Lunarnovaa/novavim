{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.md;
in {
  options = {
    novavim.languages.md = {
      enable = mkEnableOption "Markdown language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.markdown = {
      enable = true;
      format.enable = true; #defaults to deno
      lsp.enable = true; #defaults to marksman
      treesitter.enable = true;
    };
  };
}
