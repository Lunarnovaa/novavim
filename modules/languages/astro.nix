{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.astro;
in {
  options = {
    novavim.languages.astro = {
      enable = mkEnableOption "Astro language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.astro = {
      enable = true;
      format.enable = true; #defaults to prettier
      lsp.enable = true; #defaults to astro
      treesitter.enable = true;
      extraDiagnostics.enable = true;
    };
  };
}
