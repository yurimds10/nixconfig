{ config, pkgs, lib, ... }:
{ 
  nixpkgs = {
    config = {
      allowUnfree = true;
      experimental-features = "nix-command flakes";
    };
  };

  # myHomeManager.fish.enable = lib.mkDefault true;
  # myHomeManager.lf.enable = lib.mkDefault true;
  # #myHomeManager.yazi.enable = lib.mkDefault true;
  # myHomeManager.nix-extra.enable = lib.mkDefault true;
  # myHomeManager.btop.enable = lib.mkDefault true;
  # myHomeManager.nix-direnv.enable = lib.mkDefault true;
  # myHomeManager.nix.enable = lib.mkDefault true;
  # myHomeManager.git.enable = lib.mkDefault true;

  programs.home-manager.enable = true;

  programs.lazygit.enable = true;
  programs.bat.enable = true;

  home.packages = with pkgs; [
    #git
    
    p7zip
    unzip
    zip
    
    imagemagick
    killall
    fzf

    # Rust Tools
    eza
    fd
    du-dust
    ripgrep

    fastfetch
    ffmpeg
    #wget
    curl
    neovim
    tree-sitter
    nil
  ];
}