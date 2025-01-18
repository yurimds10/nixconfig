{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "~/Pictures/Wallpapers/sakura.png"
      ];

      wallpaper = [
        "HDMI-A-1,~/Pictures/Wallpapers/sakura.png"
      ];
    };
  };
}
