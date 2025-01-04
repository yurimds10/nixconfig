{ pkgs, ... }:
{
  environment = {
    localBinInPath = true;
    
    sessionVariables = {
      LIBVIRTD_ARGS="";
      NIXOS_CONFIG_DIR = "\${HOME}/nixconfig/";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      NIXPKGS_ALLOW_INSECURE = "1";
      NIXPKGS_ALLOW_UNFREE = "1";
      POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      DISABLE_QT5_COMPAT = "0";
      DIRENV_LOG_FORMAT = "";
      #LIBSEAT_BACKEND = "logind";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      GDK_SCALE = "1";
      NVD_BACKEND = "direct";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      #WLR_DRM_DEVICES = "/dev/dri/card1";
      __GLX_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_THREADED_OPTIMIZATIONS = "0";

      XDG_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
      GDK_BACKEND = "wayland,x11";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      ANKI_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";

      # REMOTE
      #RUST_BACKTRACE="1";
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
    };
  };
}
