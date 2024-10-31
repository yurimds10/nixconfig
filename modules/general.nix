{config, lib, pkgs, inputs, ...}:

{
  # Enable sound.
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.lazygit.enable = true;
  programs.adb.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
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
    starship
    eza
    fd
    du-dust
    ripgrep
    bat

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

  #----=[ Fonts ]=----#
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      # Nerd Fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [  "Liberation Serif" "Vazirmatn" ];
        sansSerif = [ "SF Pro Display" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}

