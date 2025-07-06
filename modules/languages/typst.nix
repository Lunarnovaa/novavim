{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.typst;
in {
  options = {
    novavim.languages.typst = {
      enable = mkEnableOption "Typst language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.typst = {
      enable = true;
      extensions = {
        typst-preview-nvim = {
          enable = true;
          setupOpts.extra_args = [
            "--ignore-system-fonts"
            "--input=ver=draft"
          ];
        };
      };
      format = {
        enable = true;
        type = "typstyle";
      };
      lsp.enable = true;
      treesitter.enable = true;
    };
  };
}
