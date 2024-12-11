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
      nerd-fonts.iosevka-term
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
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
