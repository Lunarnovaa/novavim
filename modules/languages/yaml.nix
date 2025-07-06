{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.yaml;
in {
  options = {
    novavim.languages.yaml = {
      enable = mkEnableOption "YAML language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.yaml = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
