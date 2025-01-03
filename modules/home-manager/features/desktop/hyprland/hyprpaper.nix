{ ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;

      preload = [
        "~/Pictures/Wallpapers/Themes/Gruvbox/4.png"
      ];

      wallpaper = [
        "HDMI-A-1,~/Pictures/Wallpapers/Themes/Gruvbox/4.png"
      ];
    };
  };
}
