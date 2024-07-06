{ config, lib, pkgs, inputs, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    hostName = "nixos"; # Define your hostname.
    firewall.enable = true;
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  };
  
  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;  

  # Configure keymap in X11
  services.xserver.xkb.layout = "br";

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yurimds = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "yurimds" = import ./home.nix;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    git
    wget
    pciutils
    usbutils
    gvfs
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  #----=[ Fonts ]=----#
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      ubuntu_font_family
      liberation_ttf
      vazir-fonts

      # Nerd Fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "DroidSansMono" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        serif = [  "Liberation Serif" "Vazirmatn" ];
        sansSerif = [ "SF Pro Display" "Ubuntu" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };

  services.devmon.enable = true;
  services.gvfs.enable = true; 
  services.udisks2.enable = true;

  services.xserver.videoDrivers = ["nvidia"];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # GAMES
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}