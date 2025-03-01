{ pkgs-stable, pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs-stable.obs-studio;

    plugins = with pkgs-stable.obs-studio-plugins; [
      wlrobs
      obs-vkcapture
      obs-vaapi
      droidcam-obs
    ];
  };
}
