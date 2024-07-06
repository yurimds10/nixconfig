{ 
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [../../homeManagerModules/default.nix];

  programs.git.userName = "yurimds";
  programs.git.userEmail = "coder73854@proton.me";
  
  home.username = "yurimds";
  home.homeDirectory = "/home/yurimds";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    # allow home-manager to configure hyprland
    enable = true;
  
    settings = {
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

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        "col.active_border" = "rgba(ebdbb2ff)";
        "col.inactive_border" = "rgba(282828ff)";

        layout = "dwindle";

        allow_tearing = false;
      };

      decoration = {
        rounding = 10;

        drop_shadow = true;
        shadow_range = 30;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

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
          # border, 1, 10, linear
          # borderangle, 1, 180, linear, loop #used by rainbow borders and rotating colors
          "fade, 1, 5, overshot"
          "workspaces, 1, 5, wind"
          "windows, 1, 5, bounce, popin"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
        special_scale_factor = 0.8;
      };

      master = {
        # new_is_master= true;
        new_on_top=1;
        mfact = 0.5;
      };

      gestures = {
        #workspace_swipe = off
        workspace_swipe = 1;
        workspace_swipe_fingers= 3;
        workspace_swipe_distance = 400;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        #vrr = 0;
        enable_swallow = true;
        no_direct_scanout = true; #for fullscreen games
        focus_on_activate = false;
        #swallow_regex = ^(kitty)$;
        #disable_autoreload = true;
      };

      #Could help when scaling and not pixelating
      xwayland = {
          force_zero_scaling = true;
      };

      "$mainMod" = "SUPER";
      bind = [  
        # Applications Binds
        "$mainMod, F1, exec, firefox"
        "$mainMod, F2, exec, nautilus"
        "$mainMod, F3, exec, nvim"
        "$mainMod, return, exec, kitty"

        "$mainMod      , Q                   , killactive,"
        "$mainMod SHIFT, M                   , exit,"
        "$mainMod SHIFT, F                   , togglefloating,"
        "$mainMod      , F                   , fullscreen,"
        "$mainMod      , G                   , togglegroup,"
        "$mainMod      , bracketleft         , changegroupactive, b"
        "$mainMod      , bracketright        , changegroupactive, f"
        "$mainMod, S, exec, rofi -show drun -show-icons"
        "$mainMod      , A                   , pin              , active"
        "$mainMod      , P                   , pseudo           ,"
        "$mainMod      , T                   , togglesplit      ,"

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
        #bind = $mainMod, S, togglespecialworkspace, magic
        "$mainMod SHIFT, S                   , movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod      , mouse_down          , workspace      , e+1"
        "$mainMod      , mouse_up            , workspace      , e-1"

        # Pipewire Sound
        "               , XF86AudioRaiseVolume, exec           , wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        "               , XF86AudioLowerVolume, exec           , wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

        # Media Playback Binds
        "               , XF86AudioPlay       , exec           , playerctl play-pause"
        "               , XF86AudioNext       , exec           , playerctl next"
        "               , XF86AudioPrev       , exec           , playerctl previous"
        "               , XF86audiostop       , exec           , playerctl stop"

        "               , print               , exec           , grim -g '$(slurp)' - | swappy -f -"
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
    };
  };

  programs.kitty = {
    enable = true;

    settings = {
      # Font Style
      font_family = "JetBrainsMono Nerd Font";
      bold_font = true;
      font_size = 11;

      # Cursor Customization
      cursor = "#a9b665";
      cursor_text_color = "#ebdbb2";
      cursor_shape = "block";
      # cursor_blink_interval = 0.5;

      # Window layout
      remember_window_size = "no";
      window_margin_width = 10;
      confirm_os_window_close = 0;

      # TAB
      tab_bar_style = "powerline";
      tab_bar_min_tabs = 2;
      tab_powerline_style = "round";
      tab_title_template = "{title}";
      active_tab_foreground = "#282828";
      active_tab_background = "#a9b665";
      active_tab_font_style = "bold-italic";
      inactive_tab_foreground = "#ebdbb2";
      inactive_tab_background = "#32302f";
      inactive_tab_font_style = "normal";

      #:COLOR SCHEME
      foreground = "#ebdbb2";
      background = "#1d2021";
      background_opacity = 1;
      active_border_color = "#d3869b";
      inactive_border_color = "#32302f";

      color0 = "#1d2021";
      color8 = "#3c3836";

      color1 = "#cc241d";
      color9 = "#fb4934";

      color2 = "#a9b665";
      color10 = "#b8bb26";

      color3 = "#d79921";
      color11 = "#fabd2f";

      color4 = "#458588";
      color12 = "#83a598";

      color5 = "#b16286";
      color13 = "#d3869b";

      color6 = "#689d6a";
      color14 = "#8ec07c";

      color7 = "#ebdbb2";
      color15 = "#ebdbb2";

      #Extra 
      shell_integration = "disabled";
      editor = "nvim";
      allow_remote_control = "yes";
      disable_ligatures = "never";
    };

    extraConfig = ''
      map kitty_mod+c copy_to_clipboard
      map ctrl+v paste_from_clipboard
      map kitty_mod+q close_window
      map kitty_mod+d next_window
      map kitty_mod+a previous_window
      map kitty_mod+w move_window_forward
      map kitty_mod+s move_window_backward
      map kitty_mod+z new_tab
      map kitty_mod+x close_tab
    '';
  };

  programs.fish = {
    enable = true;

    functions = {
      fish_prompt = {
        body = ''
          string join "" -- (set_color red) "[" (set_color yellow) $USER (set_color green) "@" (set_color blue) $hostname (set_color magenta) " " $(prompt_pwd) (set_color red) ']' (set_color normal) "\$ "
        '';
      };

      # lfcd = {
      #   body = ''
      #     cd "$(command lf -print-last-dir $argv)"
      #   '';
      # };

      hst = {
        body = ''
          history | uniq | ${pkgs.fzf}/bin/fzf | ${pkgs.wl-clipboard}/bin/wl-copy -n
        '';
      };
    };

    shellInit = ''
      set fish_greeting

      set -x EDITOR nvim

    '';

    shellAliases = {
      lf = "lfcd";
      os = "nh os";
    };

    # setup vi mode
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';
  };
}
