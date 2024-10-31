{pkgs, ...}:

{
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  environment.systemPackages = with pkgs; [
    # Launchers
    lutris
    heroic
    steam
    steam-run

    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull

    # Emulators
    duckstation
    pcsx2
    snes9x

    # Tools
    protonup
    gamemode
    dxvk
    gamescope
    mangohud
    steamPackages.steam-runtime
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
