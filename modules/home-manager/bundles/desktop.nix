{ lib, pkgs, ... }:
{
  imports = [
    # Desktop
    ../features/desktop/hyprland/default.nix
    ../features/desktop/rofi/default.nix
    ../features/desktop/sway/default.nix
    ../features/desktop/swaync/default.nix
    ../features/desktop/waybar/default.nix
    ../features/desktop/wlogout/default.nix

    # Applications
    ../features/applications/cava/default.nix
    ../features/applications/obs-studio/default.nix
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
    ../features/terminal/alacritty
  ];

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
    default = {
      de = lib.mkOption {
        type = lib.types.enum [
          ""
          "hyprland"
        ];
        default = "hyprland";
      };
      browser = lib.mkOption {
        type = lib.types.enum [
          "firefox"
          "qutebrowser"
        ];
        default = "firefox";
      };
      terminal = lib.mkOption {
        type = lib.types.enum [
          "wezterm"
          "ghostty"
          "foot"
          "kitty"
        ];
        default = "kitty";
      };
    };
  };

  config = {
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
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    droidcam
    mpv
    imv
    musikcube

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
    qalculate-gtk
  ];
  };
  }
