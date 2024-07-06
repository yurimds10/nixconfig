{ pkgs, lib, ... }: {
  imports = [
    ./bundles/general.nix
    ./bundles/desktop.nix
    # ./bundles/dev.nix
    # ./bundles/gaming.nix

    ./features/hypr/default.nix
  ];
}