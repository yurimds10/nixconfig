{ pkgs, ...}:
{
  programs.waybar = {
    enable = true;

    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });

    settings = {
      mainBar = {
      layer = "top";
      height = 20;
      spacing = 5;
      margin-top = 5;
      margin-right = 8;
      margin-left = 8;
      
      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "tray"
        "pulseaudio"
        "disk"
        "cpu"
        "memory"
        "network"
      ];

      # Hyprland
      "hyprland/workspaces" = {
        disable-scroll = true;
        active-only = false;
        all-outputs = true;
        warp-on-scroll = false;
        persistent-workspaces = {
          "*" = 5;
        };
        format = "{icon}";
        format-icons = {
          "urgent" = "";
          "focused" = "";
          "default" = "";
        };
      };

      "hyprland/window" = {
        format = "<span color='#282828' bgcolor='#d3869b' > 󰻈 </span> {class}";
        separate-outputs = true;
        icon = false;
      };

      # Utils
      clock = {
        timezone = "America/Sao_Paulo";
        format = "<span color='#282828' bgcolor='#8ec07c' >  </span> {:%H:%M:%S %A %d.%m.%y}";
        tooltip = false;
        interval = 1;
      };

      pulseaudio = {
        # "scroll-step": 1, // %, can be a float
        format = "<span color='#83a598'>[]</span> {volume}%";
        format-muted = "<span color='#ea6962'>[]</span> {volume}%";
        format-bluetooth = "<span color='#83a598'>[󰂰]</span> {volume}%";
        format-bluetooth-muted = "<span color='#ea6962'>[󰂲]</span> {volume}%";
        format-source = "{volume}% ";
        on-click = "pavucontrol -t 3";
        tooltip = false;
        max-volume = 130;
      };

      network = {
        format-disconnected = " Disconnected";
        format-ethernet = "󱘖 Wired";
        format-linked = "󱘖 {ifname} (No IP)";
        format-wifi = "󰤨 {essid}";
        interval = 5;
        max-length = 30;
        tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
      };

      # Hardware
      cpu = {
        format = "<span color='#282828' bgcolor='#e78a4e' >  </span> {usage}%";
        tooltip = false;
        interval = 2;
      };

      memory = {
        format = "<span color='#282828' bgcolor='#83a598' >  </span> {used:0.1f}GB";
        interval = 2;
      };

      disk = {
        format = "<span color='#282828' bgcolor='#ea6962' >  </span> {free}";
        interval = 20;
      };

      tray = {
        icon-size = 20;
        spacing = 8;
      };
      };
    };

    style = ''
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        padding: 0;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        border: none;
        text-shadow: none;
        transition: none;
        box-shadow: none;
      }

      /* the whole window */
      window#waybar {
        background: #282828;
        color: #ebdbb2;
        padding: 0px 5px;
        margin: 0;
        border-radius: 3px;
      }

      .modules-left {
        padding-left: 5px;
      }

      .modules-right {
        padding-right: 5px;
      }

      #custom-rofi {
        color: #222222;
        border: 2px solid #458588;
        background-color: #83a598;
        border-radius: 2px;
        padding: 0 6px;
        margin: 5px 0px 5px 0px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      /* ================================ */
      /*       workspaces module          */
      /* ================================ */
      #workspaces {
        margin: 0px;
      }

      #workspaces button {
        color: #fff4d2;
        background-color: #222222;
        border: 2px solid #fff4d2;
        border-radius: 2px;
        padding: 0 4px;
        margin: 5px 3px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      #workspaces button:hover {
        color: #222222;
        background: #d3869b;
        border: 2px solid #b16286;
      }

      #workspaces button.visible {
        color: #222222;
        border: 2px solid #689d6a;
        background-color: #8ec07c;
        border-radius: 2px;
        padding: 0 4px;
        margin: 5px 3px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      #workspaces button.visible:hover {
        color: #222222;
        border: 2px solid #689d6a;
        background-color: #8ec07c;
        border-radius: 2px;
        padding: 0 4px;
        margin: 5px 3px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      #workspaces button.active {
        color: #222222;
        border: 2px solid #689d6a;
        background-color: #8ec07c;
        border-radius: 2px;
        padding: 0 4px;
        margin: 5px 3px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      #workspaces button.active:hover {
        color: #222222;
        border: 2px solid #689d6a;
        background-color: #8ec07c;
        border-radius: 2px;
        padding: 0 4px;
        margin: 5px 3px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      #workspaces button.urgent {
        color: #222222;
        border: 2px solid #cc241d;
        background-color: #ea6962;
        border-radius: 2px;
        padding: 0 4px;
        margin: 5px 3px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
      }

      /* ================================ */
      /*            window                */
      /* ================================ */

      #window {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #d3869b;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #d3869b;
        border-radius: 3px;
      }

      /* ================================ */
      /*            tray                  */
      /* ================================ */

      #tray {
        margin: 5px 0px;
        padding: 0 6px;
        background: #333333;
        border-radius: 3px;
      }

      /* ================================ */
      /*            disk                 */
      /* ================================ */

      #disk {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #ea6962;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #ea6962;
        border-radius: 3px;
      }

      /* ================================ */
      /*            cpu                  */
      /* ================================ */
      #cpu {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #e78a4e;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #e78a4e;
        border-radius: 3px;
      }

      /* ================================ */
      /*            temp                  */
      /* ================================ */
      #temperature {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #d8a657;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #d8a657;
        border-radius: 3px;
      }

      #temperature.critical {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #cc241d;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #cc241d;
        border-radius: 3px;
      }

      /* ================================ */
      /*            backlight             */
      /* ================================ */
      #backlight {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #f6c657;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #f6c657;
        border-radius: 3px;
      }

      /* ================================ */
      /*            memory                */
      /* ================================ */
      #memory {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #458588;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #458588;
        border-radius: 3px;
      }

      /* ================================ */
      /*         pulseaudio               */
      /* ================================ */
      #pulseaudio {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #83a598;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #83a598;
        border-radius: 3px;
      }

      #pulseaudio.muted {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #ea6962;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #ea6962;
        border-radius: 3px;
      }

      /* ================================ */
      /*            battery               */
      /* ================================ */
      #battery {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #689d6a;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #689d6a;
        border-radius: 3px;
      }

      #battery.critical {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #cc241d;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #cc241d;
        border-radius: 3px;
      }

      #battery.warning {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #e78a4e;
        margin: 5px 0px;
        padding-right: 4px;
        border: 2px solid #e78a4e;
        border-radius: 3px;
      }
      /* ================================ */
      /*            clock                 */
      /* ================================ */
      #clock {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #8ec07c;
        margin: 5px 0px 5px 0px;
        padding-right: 4px;
        border: 2px solid #8ec07c;
        border-radius: 3px;
      }
    '';
  };
}
