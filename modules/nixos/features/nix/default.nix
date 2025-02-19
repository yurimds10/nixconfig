{ config, inputs, ... }:
{
  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
      
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];

      auto-optimise-store = true;
      warn-dirty = false;

      flake-registry = "";
      nix-path = config.nix.nixPath;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 1d";
    };

    optimise.automatic = true;

    channel.enable = false;
  };

  nixpkgs = {
    overlays = [];

    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = "24.11";
}
