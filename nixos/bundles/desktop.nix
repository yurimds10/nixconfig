{ ... }: {
  imports = [
    ../config/hyprland/default.nix
  ];

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
  };

  services.displayManager.defaultSession = "none+i3";

  programs.dconf.enable = true;
}
