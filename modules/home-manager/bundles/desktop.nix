{ pkgs, ... }:
{
  imports = [
    # Desktop
    #../features/desktop/hyprland/default.nix
    ../features/desktop/i3/default.nix
    ../features/desktop/sway/default.nix
    ../features/desktop/swaync/default.nix
    ../features/desktop/waybar/default.nix
    ../features/desktop/wlogout/default.nix

    # Applications
    ../features/applications/cava/default.nix
    ../features/applications/vesktop/default.nix
    ../features/applications/yazi/default.nix
    ../features/applications/zathura/default.nix

    # Browsers
    ../features/browser/firefox/default.nix
    ../features/browser/chromium/default.nix

    # Theme
    ../features/theme/gtk/default.nix
    ../features/theme/stylix/default.nix

    # Terminals
    ../features/terminal/kitty/default.nix
  ];

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["neovide.desktop"];
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

    libnotify

    # Audio
    pavucontrol

    # File Managers
    nautilus
    
    # File View
    zathura

    # Browsers
    tor-browser

    # Media
    obs-studio
    mpv
    imv

    # terminals
    kitty

    # Social Media
    vesktop

    # Study
    anki
    obsidian

    # Utils
    gimp
    gnome-disk-utility
    btop
    transmission_4-gtk
    mission-center
    nvitop
    localsend
    nwg-look
    gowall
  ];
}
