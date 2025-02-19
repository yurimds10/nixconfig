{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

  polarity = "dark";

  image = ../../../../nixos/features/stylix/sakura.png;

  #cursor.package = pkgs.capitaine-cursors-themed;
  #cursor.name = "Capitaine Cursors (Gruvbox) - White";

  fonts = {
    monospace = {
      package = pkgs.nerd-fonts.fantasque-sans-mono;
      name = "FantasqueSansMono Nerd Font";
    };
    #sansSerif = {
    #  package = pkgs.ubuntu-sans;
    #  name = "Ubuntu";
    #};
    #serif = {
    #  package = pkgs.ubuntu-sans;
    #  name = "Ubuntu";
    #};

    sizes = {
      applications = 10;
      terminal = 10;
      desktop = 10;
      popups = 10;
    };
  };

  targets.waybar.enable = false;
  targets.rofi.enable = false;
  targets.hyprland.enable = false;
  targets.kde.enable = false;
  targets.firefox.enable = false;

  autoEnable = true;
  enable = true;
}
