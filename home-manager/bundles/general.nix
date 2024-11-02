{ pkgs, ... }: {
  
  home.packages = with pkgs; [
    pciutils
    usbutils
    gvfs
    
    p7zip
    unzip
    zip
    
    imagemagick
    killall
    fzf

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
    ffmpeg
    curl
    neovim
    tree-sitter
    nil
    fish
    android-tools
    direnv
  ];
}