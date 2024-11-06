{pkgs, ...}: 
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # ...
}
