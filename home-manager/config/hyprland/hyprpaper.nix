{
  pkgs,
  ...
}: {
  services.hyprpaper.settings = {
    splash = false;

    preload = [ "/home/yurimds/Pictures/Wallpapers/Themes/Gruvbox/wall.png" ];

    wallpaper = [ "HDMI-A-1,/home/yurimds/Pictures/Wallpapers/Themes/Gruvbox/wall.png" ];
  };
}
