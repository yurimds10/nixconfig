{ pkgs, ... }: {
  
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.mangohud.enable = true;

  home.packages = with pkgs; [
    # Launchers
    lutris
    steam
    steam-run

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # Emulators
    duckstation
    snes9x

    # Tools
    protonup
    gamemode
    dxvk
    gamescope
    mangohud
    glfw

    # Vulkan
    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-utility-libraries

    # Games
    clonehero
  ];
}
