{ pkgs, ... }: {

  imports = [ ../config/sddm/default.nix ];

  programs.lazygit.enable = true;
  programs.adb.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  programs.fish.enable = true;

  # Brazil time zone.
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  #----=[ Fonts ]=----#
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      # Nerd Fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [  "New York Medium" ];
        sansSerif = [ "SF Pro Display" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
