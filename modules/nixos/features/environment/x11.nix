{ ... }:
{
  environment = {
    pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
    
    sessionVariables = {
      XDG_BACKEND = "x11";
      XDG_SESSION_TYPE = "x11";
      XDG_CURRENT_DESKTOP = "i3wm";
      XDG_SESSION_DESKTOP = "i3wm";
      GDK_BACKEND = "x11";
      SDL_VIDEODRIVER = "x11";
      CLUTTER_BACKEND = "x11";
      MOZ_ENABLE_WAYLAND = "0";
      GTK_USE_PORTAL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      ANKI_WAYLAND = "0";
      NIXOS_OZONE_WL = "0";
      QT_QPA_PLATFORM = "x11;xcb";
      ELECTRON_OZONE_PLATFORM_HINT = "x11";
    };
  };
}
