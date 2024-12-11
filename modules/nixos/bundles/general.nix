{ ... }:
{
  imports = [
    ../features/environment/default.nix
    ../features/grub/default.nix
    ../features/kernel/default.nix
    ../features/localization/default.nix
    ../features/nix/default.nix
    ../features/network/default.nix
    ../features/sddm/default.nix
    ../features/security/default.nix
    ../features/services/xserver.nix
    ../features/time/default.nix
    ../features/polkit.nix
    ../features/otimization.nix
    ../features/virtualisation/default.nix
  ];

  programs.lazygit.enable = true;
  programs.adb.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.fish.enable = true;
}
