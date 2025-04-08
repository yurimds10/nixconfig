{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "~/Pictures/Wallpapers/wall.png"
      ];

      wallpaper = [
        "HDMI-A-1,~/Pictures/Wallpapers/wall.png"
      ];
    };
  };
}
