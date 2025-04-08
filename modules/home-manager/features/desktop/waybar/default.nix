{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;

    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });

    settings = with config.colorScheme.palette; {
      mainBar = {
        layer = "top";
        gtk-layer-shell = true;
        height = 20;
        spacing = 5;
        margin-top = 6;
        margin-right = 8;
        margin-left = 8;

        modules-left = [
          "custom/rofi"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "wireplumber"
          "disk"
          "cpu"
          "memory"
          "network"
        ];

        "custom/rofi" = {
          format = "<span color='#282828' bgcolor='#d3869b'>  </span>";
          on-click = "rofi -show drun -show-icons";
          on-click-right = "~/.config/custom_scripts/power.sh";
          escape = true;
          tooltip = false;
        };

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
          format = "<span color='#${base00}' bgcolor='#a9b665' > 󰻈 </span> {class}";
          separate-outputs = true;
          icon = false;
        };

        # Utils
        clock = {
          timezone = "America/Sao_Paulo";
          format = "<span color='#${base00}' bgcolor='#${base08}' >  </span> {:%a %d %b %H:%M}";
          tooltip = false;
          interval = 1;
        };

        wireplumber = {
          # "scroll-step": 1, // %, can be a float
          format = "<span color='#${base00}' bgcolor='#${base09}'>  </span> {volume}%";
          format-muted = "<span color='#${base00}' bgcolor='#${base09}'>  </span> {volume}%";
          format-source = "{volume}% ";
          on-click = "pavucontrol -t 3";
          tooltip = false;
          max-volume = 130;
        };

        network = {
          format-disconnected = "<span color='${base00}' bgcolor='#${base0D}'>  </span> Disconnected";
          format-ethernet = "<span color='#${base00}' bgcolor='#${base0D}'> 󱘖 </span> Wired";
          format-linked = "<span color='#${base00}' bgcolor='#${base0D}'> 󱘖 </span> {ifname} (No IP)";
          format-wifi = "<span color='#${base00}' bgcolor='#${base0D}'> 󰤨 </span> {essid}";
          interval = 5;
          max-length = 30;
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
        };

        # Hardware
        cpu = {
          format = "<span color='#${base00}' bgcolor='#${base0B}' >  </span> {usage}%";
          tooltip = false;
          interval = 2;
        };

        memory = {
          format = "<span color='#${base00}' bgcolor='#${base0C}' >  </span> {used:0.1f}GB";
          interval = 2;
        };

        disk = {
          format = "<span color='#${base00}' bgcolor='#${base0A}' >  </span> {free}";
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
        background: #1d2021;
        color: #ebdbb2;
        padding: 0px 5px;
        margin: 0;
        border-radius: 10px;
      }

      .modules-left {
        padding-left: 5px;
      }

      .modules-right {
        padding-right: 5px;
      }

      #custom-rofi,
      #workspaces button,
      #workspaces button:hover,
      #workspaces button.visible,
      #workspaces button.visible:hover,
      #workspaces button.active,
      #workspaces button.active:hover,
      #workspaces button.urgent,
      #window,
      #tray,
      #disk,
      #cpu,
      #memory,
      #network,
      #temperature,
      #temperature.critical,
      #backlight,
      #wireplumber,
      #battery,
      #battery.critical,
      #battery.warning,
      #clock {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        border-radius: 3px;
      }

      #window,
      #tray,
      #disk,
      #cpu,
      #memory,
      #wireplumber,
      #network,
      #temperature,
      #temperature.critical,
      #backlight,
      #pulseaudio,
      #pulseaudio.muted,
      #battery,
      #battery.critical,
      #battery.warning,
      #clock {
        padding-right: 4px;
      }

      #custom-rofi {
        padding: 0 6px;
      }

      /* ================================ */
      /*       workspaces module          */
      /* ================================ */
      #workspaces {
        margin: 3px 0px;
        font-size: 10px;
      }

      #workspaces button {
        color: #ebdbb2;
        padding: 0 2px;
        margin: 5px 3px;
      }

      #workspaces button:hover {
        color: #d3869b;
      }

      #workspaces button.visible {
        color: #292828;
      }

      #workspaces button.visible:hover {
        color: #292828;
      }

      #workspaces button.active {
        color: #d3869b;
      }

      #workspaces button.active:hover {
        color: #d3869b;
      }

      #workspaces button.urgent {
        color: #ea6962;
      }

      /* ================================ */
      /*            window                */
      /* ================================ */
      #window {
        color: #d3869b;
      }

      #backlight {
        color: #f6c657;
      }

      /* ================================ */
      /*            disk                  */
      /* ================================ */
      #disk {
        color: #d8a657;
      }

      /* ================================ */
      /*            cpu                  */
      /* ================================ */
      #cpu {
        color: #a9b665;
      }

      /* ================================ */
      /*             network              */
      /* ================================ */
      #network {
        color: #7daea3;
      }

      /* ================================ */
      /*            temp                  */
      /* ================================ */
      #temperature {
        color: #d8a657;
      }

      #temperature.critical {
        color: #cc241d;
      }

      /* ================================ */
      /*            backlight             */
      /* ================================ */
      #backlight {
        color: #f6c657;
      }

      /* ================================ */
      /*            memory                */
      /* ================================ */
      #memory {
        color: #89b482;
      }

      /* ================================ */
      /*         pulseaudio               */
      /* ================================ */
      #wireplumber {
        color: #e78a4e;
      }

      #pulseaudio.muted {
        color: #e78a4e;
      }

      /* ================================ */
      /*            battery               */
      /* ================================ */
      #battery {
        color: #689d6a;
      }

      #battery.critical {
        color: #cc241d;
      }

      #battery.warning {
        color: #e78a4e;
      }

      /* ================================ */
      /*            clock                 */
      /* ================================ */
      #clock {
        color: #ea6962;
        margin: 5px 0px;
      }

      #tray {
        padding: 0 6px 0 6px;
      }
    '';
  };
}
