{ pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-wlr
  ];

  # enable sway window manager
  programs.sway = {
    enable = false;
    wrapperFeatures.gtk = true;
  }; 
}
