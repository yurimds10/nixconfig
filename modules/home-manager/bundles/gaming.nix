{ pkgs, ... }: {
  
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.mangohud.enable = true;

  #programs.steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];

  home.packages = with pkgs; [
    # Launchers
    lutris
    steam
    steam-run
    hydralauncher

    # wine-staging (version with experimental features)
    wineWowPackages.stagingFull

    # winetricks (all versions)
    winetricks

    wineWowPackages.fonts

    # Emulators
    duckstation
    snes9x
    pcsx2

    # Tools
    protonup
    protonup-qt
    protontricks
    protonplus
    vkd3d-proton
    gamemode
    dxvk
    vkd3d
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
    mcpelauncher-ui-qt
    mcpelauncher-client
  ];
}
