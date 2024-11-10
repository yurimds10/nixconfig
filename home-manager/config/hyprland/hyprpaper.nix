{
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "~/Pictures/Wallpapers/Themes/Gruvbox/2.png"
      ];

      wallpaper = [
        "HDMI-A-1,~/Pictures/Wallpapers/Themes/Gruvbox/2.png"
      ];
    };
  };
}
