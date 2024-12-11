{ pkgs, lib, config, ...}:
{
  imports = [ ./hyprpaper.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = with config.colorScheme.palette; {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "nm-applet --indicator"
        "hyprpaper"
	      "nwg-dock-hyprland -x -mb 5"
        "waybar"
      ];

      # -----------------------------------------------------
      # Animations
      # -----------------------------------------------------
      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "linear, 0.0, 0.0, 1.0, 1.0"
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "slow, 0, 0.85, 0.3, 1"
          "overshot, 0.7, 0.6, 0.1, 1.1"
          "bounce, 1.1, 1.6, 0.1, 0.85"
          "sligshot, 1, -1, 0.15, 1.25"
          "nice, 0, 6.9, 0.5, -4.20"
        ];

        animation = [
          "windowsIn, 1, 5, slow, popin"
          "windowsOut, 1, 5, winOut, popin"
          "windowsMove, 1, 5, wind, slide"
          "fade, 1, 5, overshot"
          "workspaces, 1, 5, wind"
          "windows, 1, 5, bounce, popin"
        ];
      };

      # -----------------------------------------------------
      # General window layout and colors
      # -----------------------------------------------------
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(${base00}ff)";
        "col.inactive_border" = "rgba(${base00}ff)";

        layout = "dwindle";

        allow_tearing = false;
      };

      #Could help when scaling and not pixelating
      xwayland = {
          force_zero_scaling = true;
      };

      # -----------------------------------------------------
      # General window decoration
      # -----------------------------------------------------
      decoration = {
        rounding = 10;

        shadow.enabled = false;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # -----------------------------------------------------
      # Layouts
      # -----------------------------------------------------
      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
        special_scale_factor = 0.8;
      };

      master = {
        new_on_top=1;
        mfact = 0.5;
      };

      gestures = {
        #workspace_swipe = off
        workspace_swipe=1;
        workspace_swipe_fingers=3;
        workspace_swipe_distance=400;
        workspace_swipe_invert=1;
        workspace_swipe_min_speed_to_force=30;
        workspace_swipe_cancel_ratio=0.5;
        workspace_swipe_create_new=1 ;
        workspace_swipe_forever=1;
      };

      # -----------------------------------------------------
      # Keyboard Layout
      # -----------------------------------------------------
      input = {
        kb_layout = "br";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      # -----------------------------------------------------
      # Misc Options
      # -----------------------------------------------------
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        #vrr = 0;
        enable_swallow = true;
        #no_direct_scanout = true; #for fullscreen games
        focus_on_activate = false;
        swallow_regex = "^(kitty)$";
        #disable_autoreload = true;
      };

      # -----------------------------------------------------
      # Environment Variables
      # -----------------------------------------------------
      env = [
        # Some default env vars.
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Capitaine Cursors (Gruvbox) - White"

        "CLUTTER_BACKEND,wayland"
        "GDK_BACKEND,wayland,x11"

        "QT_QPA_PLATFORMTHEME,qt5ct" # change to qt6ct if you have that
        "QT_SCREEN_SCALE_FACTORS,1;1"
        "QT_QPA_PLATFORM,wayland"
        "QT_SCALE_FACTOR,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

        "SDL_VIDEODRIVER,wayland"

        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "ANV_QUEUE_THREAD_DISABLE,1"

        "_JAVA_AWT_WM_NONREPARENTING,1"

        # Firefox
        "MOZ_ENABLE_WAYLAND,1"
        "MOZ_DBUS_REMOTE,1"

        # Nvidia
        # This is from Hyprland Wiki. As a start, WLR_NO_HARDWARE_CURSORS 1 will be activated if nvidia gpu detected
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"

        #__NV_PRIME_RENDER_OFFLOAD,1 
        #__VK_LAYER_NV_optimus,NVIDIA_only
        #WLR_DRM_NO_ATOMIC,1
        "NVD_BACKEND,direct"

        # nvidia firefox (for hardware acceleration on FF)?
        # check this post https://github.com/elFarto/nvidia-vaapi-driver#configuration
        "MOZ_DISABLE_RDD_SANDBOX,1"
        #"NVD_BACKEND,direct"
        "EGL_PLATFORM,wayland"

        # FOR VM and POSSIBLY NVIDIA
        #"WLR_RENDERER_ALLOW_SOFTWARE,1"

        # Vulkan
        #"WLR_RENDERER,vulkan"
      ];

      # -----------------------------------------------------
      # Keybindings
      # -----------------------------------------------------
      binds = {
        workspace_back_and_forth = 1;
        allow_workspace_cycles = 1;
        pass_mouse_when_bound = 0;
      };

      "$mainMod" = "SUPER";

      bind = [
        # Applications Binds
        "$mainMod      , F1                  , exec             , firefox"
        "$mainMod      , F2                  , exec             , nautilus"
        "$mainMod      , F11                 , exec             , sudo reboot"
        "$mainMod      , F12                 , exec             , wlogout"
        "$mainMod      , return              , exec             , kitty"

        "$mainMod      , Q                   , killactive,"
        "$mainMod SHIFT, M                   , exit,"
        "$mainMod SHIFT, F                   , togglefloating,"
        "$mainMod      , F                   , fullscreen,"
        "$mainMod      , G                   , togglegroup,"
        "$mainMod      , bracketleft         , changegroupactive, b"
        "$mainMod      , bracketright        , changegroupactive, f"
        "$mainMod      , S                   , exec             , rofi -show drun"
        "$mainMod      , O                   , exec             , wofi --show drun"
        "$mainMod      , A                   , pin              , active"
        "$mainMod      , P                   , pseudo           ," # dwindle
        "$mainMod      , T                   , togglesplit      ," # dwindle

        # Move focus with mainMod + arrow keys
        "$mainMod      , left                , movefocus      , l"
        "$mainMod      , right               , movefocus      , r"
        "$mainMod      , up                  , movefocus      , u"
        "$mainMod      , down                , movefocus      , d"

        "$mainMod      , h                   , movefocus      , l"
        "$mainMod      , l                   , movefocus      , r"
        "$mainMod      , k                   , movefocus      , u"
        "$mainMod      , j                   , movefocus      , d"

        "$mainMod SHIFT, h                   , movewindow     , l"
        "$mainMod SHIFT, l                   , movewindow     , r"
        "$mainMod SHIFT, k                   , movewindow     , u"
        "$mainMod SHIFT, j                   , movewindow     , d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod      , 1                   , workspace      , 1"
        "$mainMod      , 2                   , workspace      , 2"
        "$mainMod      , 3                   , workspace      , 3"
        "$mainMod      , 4                   , workspace      , 4"
        "$mainMod      , 5                   , workspace      , 5"
        "$mainMod      , 6                   , workspace      , 6"
        "$mainMod      , 7                   , workspace      , 7"
        "$mainMod      , 8                   , workspace      , 8"
        "$mainMod      , 9                   , workspace      , 9"
        "$mainMod      , 0                   , workspace      , 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1                   , movetoworkspace, 1"
        "$mainMod SHIFT, 2                   , movetoworkspace, 2"
        "$mainMod SHIFT, 3                   , movetoworkspace, 3"
        "$mainMod SHIFT, 4                   , movetoworkspace, 4"
        "$mainMod SHIFT, 5                   , movetoworkspace, 5"
        "$mainMod SHIFT, 6                   , movetoworkspace, 6"
        "$mainMod SHIFT, 7                   , movetoworkspace, 7"
        "$mainMod SHIFT, 8                   , movetoworkspace, 8"
        "$mainMod SHIFT, 9                   , movetoworkspace, 9"
        "$mainMod SHIFT, 0                   , movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, M, togglespecialworkspace, magic"
        "$mainMod SHIFT, S                   , movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod      , mouse_down          , workspace      , e+1"
        "$mainMod      , mouse_up            , workspace      , e-1"

        # Pipewire Sound
        "              , XF86AudioRaiseVolume, exec           , wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        "              , XF86AudioLowerVolume, exec           , wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

        # Media Playback Binds
        "              , XF86AudioPlay       , exec           , playerctl play-pause"
        "              , XF86AudioNext       , exec           , playerctl next"
        "              , XF86AudioPrev       , exec           , playerctl previous"
        "              , XF86audiostop       , exec           , playerctl stop"

        # Print Screen
        ''              , print               , exec           , grim -g "$(slurp)"''
        ''$mainMod      , print               , exec           , grim -g "$(slurp)" - | wl-copy''
        ''$mainMod SHIFT, print               , exec           , grim -g "$(slurp)" - | swappy -f -''
      ];

      binde = [
        "$mainMod SHIFT, h, moveactive, -20 0"
        "$mainMod SHIFT, l, moveactive, 20 0"
        "$mainMod SHIFT, k, moveactive, 0 -20"
        "$mainMod SHIFT, j, moveactive, 0 20"

        "$mainMod CTRL, l, resizeactive, 30 0"
        "$mainMod CTRL, h, resizeactive, -30 0"
        "$mainMod CTRL, k, resizeactive, 0 -10"
        "$mainMod CTRL, j, resizeactive, 0 10"
      ];

        bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # -----------------------------------------------------
      # Window rules
      # -----------------------------------------------------
      windowrule = [
        "tile,^(Microsoft-edge)$"
        "tile,^(Brave-browser)$"
        "tile,^(Chromium)$"
        "float,^(pavucontrol)$"
        "float,^(qalculate-gtk)$"

        # Pavucontrol floating
        "float,class:(.*org.pulseaudio.pavucontrol.*)"
        "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
        "center,class:(.*org.pulseaudio.pavucontrol.*)"
        "pin,class:(.*org.pulseaudio.pavucontrol.*)"

        # System Mission Center
        "float, class:(io.missioncenter.MissionCenter)"
        "pin, class:(io.missioncenter.MissionCenter)"
        "center, class:(io.missioncenter.MissionCenter)"
        "size 900 600, class:(io.missioncenter.MissionCenter)"

        # System Mission Center Preference Window
        "float, class:(missioncenter), title:^(Preferences)$"
        "pin, class:(missioncenter), title:^(Preferences)$"
        "center, class:(missioncenter), title:^(Preferences)$"

        # Browser Picture in Picture
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "move 69.5% 4%, title:^(Picture-in-Picture)$"
      ];
    };
  };

  home.packages = with pkgs; [
    grim
    slurp
    swappy
    wl-clipboard
    hyprpaper
    networkmanagerapplet
    rofi-wayland
    wofi
    wlogout
  ];
}
