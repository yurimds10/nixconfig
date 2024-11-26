{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernelParams = [ 
    "quiet"
    "splash"
  ];
}
