{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.ts;
in {
  options = {
    novavim.languages.ts = {
      enable = mkEnableOption "Typescript language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.ts = {
      enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
