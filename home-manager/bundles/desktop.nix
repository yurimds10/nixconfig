{
  pkgs,
  ...
}: {
  imports = [
    ../config/gtk/default.nix
    ../config/hyprland/default.nix
    ../config/ags/default.nix
    ../config/i3/default.nix
    ../config/lf/default.nix
    ../config/kitty/default.nix
  ];

  home.packages = with pkgs; [
    # Polkit
    polkit
    polkit_gnome

    # X11 Desktop
    polybar
    dunst
    libnotify
    nitrogen
    picom
    lxappearance

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
    qbittorrent
    mission-center
    nvitop
    flameshot
    localsend
    xdg-user-dirs
    nwg-look

    # Themes
    gruvbox-gtk-theme
    gruvbox-plus-icons
    capitaine-cursors-themed
  ];
}
