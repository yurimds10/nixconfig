{ pkgs, lib, config, ...}:
  let
    inherit (lib) mkIf;

    _ = lib.getExe;

    # OCR (Optical Character Recognition) utility
    ocrScript =
      let
        inherit (pkgs)
          grim
          libnotify
          slurp
          tesseract5
          wl-clipboard
        ;
      in
      pkgs.writeShellScriptBin "wl-ocr" ''
        ${_ grim} -g "$(${_ slurp})" -t ppm - | ${_ tesseract5} - - | ${wl-clipboard}/bin/wl-copy
        ${_ libnotify} "$(${wl-clipboard}/bin/wl-paste)"
      '';

      # Volume control utility
      volumectl = 
        let
          inherit (pkgs) libnotify pamixer libcanberra-gtk3;
        in
        pkgs.writeShellScriptBin "volumectl" ''
          #!/usr/bin/env bash

          case "$1" in
          up)
            ${_ pamixer} -i "$2"
            ;;
          down)
            ${_ pamixer} -d "$2"
            ;;
          toggle-mute)
            ${_ pamixer} -t
            ;;
          esac

          volume_percentage="$(${_ pamixer} --get-volume)"
          isMuted="$(${_ pamixer} --get-mute)"

          if [ "$isMuted" = "true" ]; then
            ${libnotify}/bin/notify-send --transient \
            -u normal \
            -a "VOLUMECTL" \
            -i audio-volume-muted-symbolic \
            "VOLUMECTL" "Volume Muted"
          else
            ${libnotify}/bin/notify-send --transient \
              -u normal \
              -a "VOLUMECTL" \
              -h string:x-canonical-private-synchronous:volumectl \
              -h int:value:"$volume_percentage" \
              -i audio-volume-high-symbolic \
              "VOLUMECTL" "Volume: $volume_percentage%"

            ${libcanberra-gtk3}/bin/canberra-gtk-play -i audio-volume-change -d "volumectl"
          fi
      '';
  in {
  imports = [
    ./config
    ./hyprpaper.nix
  ];

  config = mkIf (config.default.de == "hyprland") {
    home = {
      packages = with pkgs; [
        config.wayland.windowManager.hyprland.package

        dbus
        glib
        grim
        gtk3
        libcanberra-gtk3
        libnotify
        pamixer
        sassc
        slurp
        swappy
        wl-clipboard
        wf-recorder
        wlr-randr
        wlr-randr
        kdePackages.xwaylandvideobridge
        ydotool
        wlprop
        xorg.xprop

        hyprpaper
        networkmanagerapplet
        rofi-wayland
        wofi
        wlogout
        nwg-dock-hyprland

        ocrScript
        volumectl
      ];

      sessionVariables = {
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        XDG_SESSION_TYPE = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        QT_STYLE_OVERRIDE = lib.mkForce "kvantum";
      };
    };

    wayland.windowManager.hyprland = with config.colorScheme.palette; {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprpaper"
        "hyprpanel"
        "nwg-dock-hyprland -mb 10 -x"
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
      xwayland.force_zero_scaling = true;

      # -----------------------------------------------------
      # General window decoration
      # -----------------------------------------------------
      decoration = lib.mkDefault {
        rounding = 8;

        shadow.enabled = false;

        active_opacity = 1.0;
        inactive_opacity = 0.95;

        blur = {
          enabled = true;
          size = 10;
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
      # Input
      # -----------------------------------------------------
      input = {
        kb_layout = "br";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        touchpad.natural_scroll = false;

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
        swallow_regex = "kitty|nautilus|waybar";
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
      # Window rules
      # -----------------------------------------------------
      windowrulev2 = [
        "float, class:^(qalculate-gtk)$"

        # Pavucontrol floating
        "float, class:^(pavucontrol)$"
        "size 700 600, class:^(pavucontrol)$"
        "center, class:^(pavucontrol)$"
        "pin, class:^(pavucontrol)$"

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

    systemd.user.targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };
  };
}
