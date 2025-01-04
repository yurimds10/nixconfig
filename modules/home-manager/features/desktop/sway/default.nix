{ pkgs, lib, ... }:
{
  wayland.windowManager.sway = {
    enable = true;

    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        { command = "waybar"; always = true; }
        { command = "vesktop";}
      ];

      gaps = {
        inner = 10;
        outer = 5;
      };

      input = {
        "*" = {
          xkb_layout = "br";
        };
      };
      
      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec kitty";
        "${modifier}+q" = "kill";
        "${modifier}+d" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun";

        "${modifier}+F12" = "exec ${pkgs.wlogout}/bin/wlogout";

        "XF86AudioRaiseVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # Focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        # Move
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        ## Work tables
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";
        "${modifier}+6" = "workspace 6";
        "${modifier}+Shift+1" = "move container to workspace 1";
        "${modifier}+Shift+2" = "move container to workspace 2";
        "${modifier}+Shift+3" = "move container to workspace 3";
        "${modifier}+Shift+4" = "move container to workspace 4";
        "${modifier}+Shift+5" = "move container to workspace 5";
        "${modifier}+Shift+6" = "move container to workspace 6";
      };
    };
  };
}
