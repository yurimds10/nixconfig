{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [ 
    "quiet"
    "splash"
  ];
}
