{ pkgs, lib, ...}:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  
  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
    };
  };
}
