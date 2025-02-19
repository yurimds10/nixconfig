{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      # -----------------------------------------------------
      # Keybindings
      # -----------------------------------------------------
      binds = {
        workspace_back_and_forth = 1;
        allow_workspace_cycles = 1;
        pass_mouse_when_bound = 0;
      };

      "$mainMod" = "SUPER";

      bind =
      let
        screenshot = import ../scripts/screenshot.nix { inherit pkgs; };
      in
      [
        # Applications Binds
        "SUPER, S, exec, rofi -show drun"
        "SUPER, O, exec, wofi --show drun"
        "SUPER, F12, exec, wlogout"
        "SUPER, return, exec, kitty"

        "SUPER, Q, killactive,"
        "SUPERSHIFT, M, exit,"
        "SUPERSHIFT, F, togglefloating,"
        "SUPER, F, fullscreen,"
        "SUPER, G, togglegroup,"
        "SUPER, bracketleft , changegroupactive, b"
        "SUPER, bracketright, changegroupactive, f"
        "SUPER, A, pin, active"
        "SUPER, P, pseudo," # dwindle
        "SUPER, T, togglesplit," # dwindle

        # Move focus with mainMod + arrow keys
        "$SUPER, left,  movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up   , movefocus, u"
        "SUPER, down , movefocus, d"

        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        " SUPERSHIFT, h, movewindow, l"
        " SUPERSHIFT, l, movewindow, r"
        " SUPERSHIFT, k, movewindow, u"
        " SUPERSHIFT, j, movewindow, d"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPERSHIFT, 1, movetoworkspace, 1"
        "SUPERSHIFT, 2, movetoworkspace, 2"
        "SUPERSHIFT, 3, movetoworkspace, 3"
        "SUPERSHIFT, 4, movetoworkspace, 4"
        "SUPERSHIFT, 5, movetoworkspace, 5"
        "SUPERSHIFT, 6, movetoworkspace, 6"
        "SUPERSHIFT, 7, movetoworkspace, 7"
        "SUPERSHIFT, 8, movetoworkspace, 8"
        "SUPERSHIFT, 9, movetoworkspace, 9"
        "SUPERSHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "SUPER, M, togglespecialworkspace, magic"
        "SUPERSHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER, mouse_down          , workspace      , e+1"
        "SUPER, mouse_up            , workspace      , e-1"

        # Media Playback Binds
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86audiostop, exec, playerctl stop"

        # Screenshot
        "SUPERSHIFT, print, exec, ${screenshot}/bin/screenshot a"
        "SUPERALT, print, exec, ${screenshot}/bin/screenshot f"
        ",print, exec, ${screenshot}/bin/screenshot f"
      ];

      binde = [
        "SUPERSHIFT, h, moveactive, -20 0"
        "SUPERSHIFT, l, moveactive, 20 0"
        "SUPERSHIFT, k, moveactive, 0 -20"
        "SUPERSHIFT, j, moveactive, 0 20"

        "SUPERCTRL, l, resizeactive, 30 0"
        "SUPERCTRL, h, resizeactive, -30 0"
        "SUPERCTRL, k, resizeactive, 0 -10"
        "SUPERCTRL, j, resizeactive, 0 10"

        ", XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer -i 5"
        ", XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer -d 5"
        ", XF86AudioMute, exec, volumectl toggle-mute "
        ", XF86AudioMicMute, exec, ${pkgs.pamixer}/bin/pamixer --default-source --toggle-mute "
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };
}
