{
  pkgs,
  ...
}: {
  imports = [
    ../config/gtk/default.nix
    ../config/hyprland/default.nix
    ../config/ags/default.nix
    ../config/lf/default.nix
    ../config/kitty/default.nix
    ../config/vesktop/default.nix
    ../config/zathura/default.nix
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
    gnome-disk-utility
    gpaste
    gparted
    btop
    transmission-gtk
    mission-center
    nvitop
    flameshot
    localsend
    xdg-user-dirs
    xdg-utils
    nwg-look
    nwg-dock-hyprland

    # Themes
    gruvbox-gtk-theme
    gruvbox-plus-icons
    capitaine-cursors-themed
  ];
}
