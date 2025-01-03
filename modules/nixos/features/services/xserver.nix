{ lib, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = lib.mkDefault false;
    };
  };
}
