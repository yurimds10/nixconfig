{ inputs, pkgs, ...}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;

    base16Scheme = {
      base00 = "1d2021";
      base01 = "32302f";
      base02 = "504945";
      base03 = "665c54";
      base04 = "bdae93";
      base05 = "ddc7a1";
      base06 = "ebdbb2";
      base07 = "fbf1c7";
      base08 = "ea6962";
      base09 = "e78a4e";
      base0A = "d8a657";
      base0B = "a9b665";
      base0C = "89b482";
      base0D = "7daea3";
      base0E = "d3869b";
      base0F = "bd6f3e";
    };

    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

    polarity = "dark";

    image = ./sakura.png;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        name = "FantasqueSansM Nerd Font";
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
        terminal = 14;
        desktop = 10;
        popups = 10;
      };
    };

    #cursor.package = pkgs.capitaine-cursors-themed;
    #cursor.name = "Capitaine Cursors (Gruvbox) - White";
    
    targets.chromium.enable = true;
    targets.grub.enable = true;
    targets.grub.useImage = true;
    targets.plymouth.enable = true;

    # opacity.terminal = 1;
    # stylix.targets.nixos-icons.enable = true;

    autoEnable = false;
  };
}
