{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.css;
in {
  options = {
    novavim.languages.css = {
      enable = mkEnableOption "CSS language support";
    };
  };

  config = mkIf cfg.enable {
    vim = {
      languages.css = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      ui.colorizer.setupOpts.user_default_options.css = true;
    };
  };
}
