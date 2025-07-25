{ config, lib, pkgs, ... }:
  let
    inherit (lib) mkIf mkEnableOption;

    dependencies = with pkgs; [
      bash
      config.wayland.windowManager.hyprland.package
      coreutils
      grim
      hyprpicker
      jq
      libnotify
      slurp
      wl-clipboard
  ];
  
  settings = import ./settings.nix { inherit lib pkgs; };
  style = import ./style.nix { inherit config; };

  cfg = config.opt.services.swaync;

in {
  options.opt.services.swaync.enable = mkEnableOption "swaync";

  config = mkIf cfg.enable {
    services.swaync = {
      enable = false;
      package = pkgs.swaynotificationcenter;

      inherit settings;
      inherit (style) style;
    };

    systemd.user.services.swaync.Service.Environment =
      "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
  };
}
