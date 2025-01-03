{ ... }: {
  imports = [
    ../features/desktop/hyprland/default.nix
    ../features/desktop/i3/default.nix
    ../features/desktop/sway/default.nix
    ../features/fonts/default.nix
    ../features/stylix/default.nix
  ];

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  programs.dconf.enable = true;
}
