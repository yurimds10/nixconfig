{ inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default

    ../../modules/home-manager/bundles/general.nix
    ../../modules/home-manager/bundles/desktop.nix
    ../../modules/home-manager/bundles/dev.nix
    ../../modules/home-manager/bundles/gaming.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "yurimds";
    homeDirectory = "/home/yurimds";
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
