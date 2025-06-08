{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.nu;
in {
  options = {
    novavim.languages.nu = {
      enable = mkEnableOption "Nu language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.nu = {
      enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
