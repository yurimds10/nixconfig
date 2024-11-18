{pkgs, ...}: {
  
  environment.systemPackages = with pkgs; [
    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # wine with wayland
    wineWowPackages.waylandFull

    # winetricks (all versions)
    winetricks

    # Vulkan
    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-utility-libraries
  ];
}

