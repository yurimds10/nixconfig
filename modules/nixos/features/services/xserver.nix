{ lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = lib.mkDefault false;
    };

    excludePackages = with pkgs; [
      xterm
    ];
  };
}
