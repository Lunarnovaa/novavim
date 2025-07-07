{
  lunarsLib,
  system,
  pkgs,
  nvf,
}: let
  mkNovavimPackage = lunarsLib.builders.mkNovavimPackage {inherit pkgs lunarsLib nvf;};

  packages.${system} = {
    default = packages.maximal;
    maximal = mkNovavimPackage {
      config.novavim = {
        languages = {
          astro.enable = true;
          bash.enable = true;
          css.enable = true;
          md.enable = true;
          nix.enable = true;
          nu.enable = true;
          py.enable = true;
          ts.enable = true;
        };
      };
    };
    aurabora = mkNovavimPackage {
      config.novavim = {
        languages = {
          astro.enable = true;
          css.enable = true;
          md.enable = true;
          nix.enable = true;
          ts.enable = true;
        };
      };
    };
    lunarsLib = mkNovavimPackage {
      config.novavim = {
        languages = {
          md.enable = true;
          nix.enable = true;
        };
      };
    };
    lunix = mkNovavimPackage {
      config.novavim = {
        languages = {
          css.enable = true;
          md.enable = true;
          nix.enable = true;
          nu.enable = true;
          ts.enable = true;
        };
      };
    };
  };
in {inherit packages;}
