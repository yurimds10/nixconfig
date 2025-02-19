{ inputs, pkgs, ...}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

    polarity = "dark";

    image = ./sakura.png;

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
        terminal = 10.5;
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
