{ pkgs, ... }: {

  imports = [
    ../config/git/default.nix
    ../config/fish/default.nix
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

    #git
    wget
    fastfetch
    curl
    neovim
    tree-sitter
    nil
    fish
    android-tools
    direnv
  ];
}
