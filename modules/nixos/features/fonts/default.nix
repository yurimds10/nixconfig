{ pkgs, ...}:
{
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
