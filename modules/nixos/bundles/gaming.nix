{pkgs, ...}: {
  
  environment.systemPackages = with pkgs; [
    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # wine with wayland
    wineWowPackages.waylandFull

    # winetricks (all versions)
    winetricks

    # Controllers
    python313Packages.ds4drv
    steamcontroller
  ];
}

