{pkgs, ...}: {
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.mangohud.enable = true;

  home.packages = with pkgs; [
    # Launchers
    lutris
    heroic
    steam
    steam-run

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
    vulkan-tools
    vulkan-loader
    vulkan-headers

    # Games
    clonehero
  ];
}