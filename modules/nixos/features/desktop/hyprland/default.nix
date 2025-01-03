{pkgs, ...}: 
{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-wlr
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
