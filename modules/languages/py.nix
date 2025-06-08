{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.py;
in {
  options = {
    novavim.languages.py = {
      enable = mkEnableOption "Python language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.python = {
      enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
