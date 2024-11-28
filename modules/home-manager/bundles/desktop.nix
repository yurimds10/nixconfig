{
  pkgs,
  ...
}: {
  imports = [
    ../features/alacritty/default.nix
    ../features/dunst/default.nix
    ../features/cava/default.nix
    ../features/firefox/default.nix
    ../features/gtk/default.nix
    ../features/hyprland/default.nix
    ../features/kitty/default.nix
    ../features/lf/default.nix
    ../features/spicetify/default.nix
    ../features/vesktop/default.nix
    ../features/waybar/default.nix
    ../features/wlogout/default.nix
    ../features/yazi/default.nix
    ../features/zathura/default.nix
  ];

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
    google-chrome
    microsoft-edge
    tor-browser

    # Media
    obs-studio
    mpv
    imv
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
    gnome-disk-utility
    gparted
    btop
    transmission_4-gtk
    mission-center
    nvitop
    localsend
    xdg-user-dirs
    nwg-look
    nwg-dock-hyprland
    gowall

    # Themes
    gruvbox-gtk-theme
    gruvbox-plus-icons
    capitaine-cursors-themed
  ];
}
