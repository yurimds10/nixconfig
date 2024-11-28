{ ... }:
{
  imports = [
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix

    # Bundles
    ../../modules/nixos/bundles/hardware.nix
    ../../modules/nixos/bundles/general.nix
    ../../modules/nixos/bundles/desktop.nix
    ../../modules/nixos/bundles/users.nix
    ../../modules/nixos/bundles/gaming.nix
  ];

  # Some programs need SUID wrappers
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
