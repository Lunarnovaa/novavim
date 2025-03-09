{
  imports = [
    ./maximal.nix
  ];

  perSystem = {self',...}: {
    packages.default = self'.packages.maximal;
  };
}
