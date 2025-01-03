{ pkgs, lib, ...}:
{
  imports = [ ../../environment/x11.nix ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  
  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
    };
  };
}
