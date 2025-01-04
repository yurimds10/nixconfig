{ pkgs, lib, modulesPath, ... }:
{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"

    # Bundles
    #../../modules/nixos/bundles/hardware.nix
    #../../modules/nixos/bundles/general.nix
    ../../modules/nixos/bundles/desktop.nix
    ../../modules/nixos/bundles/users.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
