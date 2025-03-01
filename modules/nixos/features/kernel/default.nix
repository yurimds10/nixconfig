{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelModules = [
    "v4l2loopback" # Webcam loopback
  ];

  boot.extraModulePackages = [
    pkgs.linuxPackages_zen.v4l2loopback # Webcam loopback
  ];

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  boot.kernelParams = [ 
    "quiet"
    "splash"
  ];
}
