{pkgs, ...}: 
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    
    config = {
      common.default = [ "hyprland" "gtk" ];
      hyprland.default = [ "hyprland" ];
    };

    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
