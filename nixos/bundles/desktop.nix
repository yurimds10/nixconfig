{ ... }: {
  imports = [
    ../config/hyprland/default.nix
  ];

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  programs.dconf.enable = true;
}
