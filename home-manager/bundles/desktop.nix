{
  pkgs,
  ...
}: {
  imports = [
    ../features/gtk/default.nix
    ../features/hyprland/default.nix
    ../features/ags/default.nix
    ../features/lf/default.nix
    ../features/kitty/default.nix
    ../features/vesktop/default.nix
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
    transmission_4-gtk
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
