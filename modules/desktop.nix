{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    # Polkit
    polkit
    polkit_gnome

    # Hyprland
    waybar
    hyprpaper
    rofi-wayland
    ags
    wl-clipboard
    slurp
    grim
    swappy
    wlogout

    # Audio
    pavucontrol

    # File Managers
    gnome.nautilus
    lf
    
    # File View
    zathura

    # Browsers
    firefox
    google-chrome
    microsoft-edge
    tor-browser

    # Media
    obs-studio
    mpv
    imv
    spotify
    spicetify-cli
    stremio

    # terminals
    kitty
    alacritty
    wezterm

    # Social Media
    whatsapp-for-linux
    telegram-desktop
    vesktop

    # Study
    anki
    obsidian

    # Utils
    gimp
    gnome.gnome-disk-utility
    gparted
    nwg-look
    btop
    qbittorrent
    mission-center
    nvitop

    # Themes
    gruvbox-gtk-theme
    gruvbox-plus-icons
    capitaine-cursors-themed
  ];
}
