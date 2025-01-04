{ inputs, pkgs, ...}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;

    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    base16Scheme = {
      base00 = "282828"; # ----
      base01 = "3c3836"; # ---
      base02 = "504945"; # --
      base03 = "665c54"; # -
      base04 = "bdae93"; # +
      base05 = "d5c4a1"; # ++
      base06 = "ebdbb2"; # +++
      base07 = "fbf1c7"; # ++++
      base08 = "fb4934"; # red
      base09 = "fe8019"; # orange
      base0A = "fabd2f"; # yellow
      base0B = "b8bb26"; # green
      base0C = "8ec07c"; # aqua/cyan
      base0D = "83a598"; # blue
      base0E = "d3869b"; # purple
      base0F = "d65d0e"; # brown
    };

    polarity = "dark";

    image = ./wallpaper.png;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
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
