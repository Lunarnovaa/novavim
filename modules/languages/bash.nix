{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.bash;
in {
  options = {
    novavim.languages.bash = {
      enable = mkEnableOption "Bash language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.bash = {
      enable = true;
      format.enable = true;
      lsp.enable = true;
      treesitter.enable = true;
      extraDiagnostics.enable = true;
    };
  };
}
