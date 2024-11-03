{
  pkgs,
  ...
}: let
    modifier = "Mod4";
    background = "#282828";
    foreground = "#ebdbb2";
    accent     = "#83a598";
    urgent     = "#cc241d";
    text       = "#fbf1c7";
    overlay0   = "#665c54";
    base       = "#32302f";
  in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      inherit modifier;

      bars = [];

      fonts = [ "JetBrainsMono Nerd Font" ];

      gaps = {
        inner = 6;
        outer = 3;
      };

      keybindings = {
        "${modifier}+Y"       = "split h";           # split in horizontal orientation
        "${modifier}+V"       = "split v";           # split in vertical orientation
        "${modifier}+Shift+F" = "fullscreen toggle"; # enter fullscreen mode for the focused container
        "${modifier}+F"       = "floating toggle";   # toggle tiling / floating       
        "${modifier}+Space"   = "focus mode_toggle"; # change focus between tiling / floating windows
        "${modifier}+A"       = "focus parent";      # focus the parent container
        "${modifier}+D"       = "focus child";       # focus the child container

        # change container layout (stacked, tabbed, toggle split)
        "${modifier}+E" = "layout stacking";
        "${modifier}+W" = "layout tabbed";
        "${modifier}+T" = "layout toggle split";
        
        # Kitty terminal
        "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";

        # Rofi
        "${modifier}+s" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        # Screenshot
        "${modifier}+Print" = "exec ${pkgs.flameshot}/bin/flameshot gui -c";
        "${modifier}+Shift+Print" = "exec ${pkgs.flameshot}/bin/flameshot gui";

        # Move focus with mainMod + arrow keys
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        "${modifier}+Left"  = "focus left";
        "${modifier}+Down"  = "focus down";
        "${modifier}+Up"    = "focus up";
        "${modifier}+Right" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        # Switch workspaces with mainMod + [0-9]
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";

        # Pipewire Sound
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

        # Media Playback Binds
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86audiostop" = "exec playerctl stop";
      };

      startup = [
        # {
        #  command = "${pkgs.xmousepasteblock}/bin/xmousepasteblock";
        #  always = true;
        #  notification = false;
        # }
        {
          command = "${pkgs.picom}/bin/picom";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.nitrogen}/bin/nitrogen --restore";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.polybar}/bin/polybar";
          always = false;
          notification = false;
        }
      ];
    };

    extraConfig = ''
      default_border none
      for_window [class=".*"] border pixel 2, move

      client.focused          ${background} ${accent} ${background} ${foreground} ${accent}
      client.focused_inactive ${overlay0}   ${base}   ${text}       ${foreground} ${overlay0}
      client.unfocused        ${overlay0}   ${base}   ${text}       ${foreground} ${overlay0}
      client.urgent           ${urgent}     ${base}   ${urgent}     ${overlay0}   ${urgent}
      client.placeholder      ${overlay0}   ${base}   ${text}       ${overlay0}   ${overlay0}
      client.background       ${base}
    '';
  };
}
