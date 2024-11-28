{ pkgs, ... }: {

  imports = [
    ../features/bat/default.nix
    ../features/git/default.nix
    ../features/direnv/default.nix
    ../features/fish/default.nix
    ../features/nushell/default.nix
    ../features/starship/default.nix
  ];

  xdg.userDirs.enable = true;

  home.packages = with pkgs; [
    pciutils
    usbutils
    gvfs
    
    p7zip
    unzip
    zip
    
    ffmpeg
    ffmpegthumbnailer
    imagemagick
    poppler
    killall
    fzf
    jq

    # Rust Tools
    bat
    eza
    fd
    procs
    sd
    du-dust
    starship
    ripgrep
    tokei
    hyperfine
    tealdeer
    bandwhich
    grex
    zoxide
    delta
    nushell

    git
    wget
    fastfetch
    curl
    nil
    fish
    android-tools
    direnv
  ];
}
