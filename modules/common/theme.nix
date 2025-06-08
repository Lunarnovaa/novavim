{
  lib,
  inputs,
  config,
  ...
}: let
  inherit (lib.options) mkOption mkEnableOption;
  inherit (inputs.nvf.lib.nvim.types) hexColor;
  inherit (lib.modules) mkIf;
  inherit (lib.nvim.attrsets) mapListToAttrs;
  inherit (lib.strings) hasPrefix;

  # Taken from NotAShelf/nvf, available under the MIT License
  numbers = ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F"];
  base16Options =
    mapListToAttrs (n: {
      name = "base0${n}";
      value = mkOption {
        description = "The base0${n} color to use";
        type = hexColor;
        apply = v:
          if hasPrefix "#" v
          then v
          else "#${v}";
      };
    })
    numbers;
  # End of MIT License Availability
  # Following is available under GPLv3 as according to LICENSE

  cfg = config.novavim.theme.base16;
in {
  options.novavim.theme.base16 = {
    enable = mkEnableOption "base16-colors for Novavim";
    colors = base16Options;
  };

  config.vim = mkIf cfg.enable {
    theme = {
      name = "base16";
      base16-colors = cfg.colors;
    };
    statusline.lualine.theme = "base16";
  };
}
