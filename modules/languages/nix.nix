{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf;

  cfg = config.novavim.languages.nix;
in {
  options = {
    novavim.languages.nix = {
      enable = mkEnableOption "Nix language support";
    };
  };

  config = mkIf cfg.enable {
    vim.languages.nix = {
      enable = true;
      format.enable = true; #defaults to alejandra
      lsp.enable = true; # defaults to nil
      treesitter.enable = true;
      extraDiagnostics.enable = true;
    };
  };
}
