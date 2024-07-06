{ pkgs,
  config,
  inputs,
  lib,
  ...
}: {   
  config = {
    xdg.mimeApps.defaultApplications = {
      # "text/plain" = ["neovide.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "image/*" = ["imv.desktop"];
      "video/png" = ["mpv.desktop"];
      "video/jpg" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];
    };

    home.packages = with pkgs; [
      # Polkit
      polkit
      polkit_gnome

      # Hyprland
      hyprpaper
      rofi-wayland
      ags
      wl-clipboard

      # Audio
      pavucontrol

      # File Managers
      nautilus
      lf
      
      # File View
      zathura

      # Media
      obs-studio
      mpv
      imv

      # terminals
      kitty
      alacritty

      # Social Media
      # telegram
      discord

      # Study
      anki
      obsidian
    ];
  };
}
