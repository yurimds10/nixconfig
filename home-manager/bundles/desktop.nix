{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../config/i3/default.nix
  ];

  home.packages = with pkgs; [
    # Polkit
    polkit
    polkit_gnome

    # X11 Desktop
    polybar
    rofi
    dunst
    libnotify
    nitrogen
    picom
    lxappearance

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
    btop
    qbittorrent
    mission-center
    nvitop
    flameshot

    # Themes
    gruvbox-gtk-theme
    gruvbox-plus-icons
    capitaine-cursors-themed
  ];
}
