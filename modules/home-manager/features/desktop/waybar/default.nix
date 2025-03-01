{ pkgs, config, ...}:
{
  programs.waybar = {
    enable = true;

    
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });

    settings = with config.lib.stylix.colors; {
      mainBar = {
        layer = "top";
        gtk-layer-shell = true;
        height = 20;
        spacing = 5;
        margin-top = 10;
        margin-right = 8;
        margin-left = 8;
      
        modules-left = [
          "custom/launcher"
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
          format = "<span color='#${base00}' bgcolor='#a9b665' > 󰻈 </span> {class}";
          separate-outputs = true;
          icon = false;
        };

        # Utils
        clock = {
          timezone = "America/Sao_Paulo";
          format = "<span color='#${base00}' bgcolor='#${base08}' >  </span> {:%H:%M:%S %A %d.%m.%y}";
          tooltip = false;
          interval = 1;
        };

        pulseaudio = {
          # "scroll-step": 1, // %, can be a float
          format = "<span color='#${base00}' bgcolor='#${base09}'>  </span> {volume}%";
          format-muted = "<span color='#${base00}' bgcolor='#${base09}'>  </span> {volume}%";
          format-bluetooth = "<span color='#${base00}' bgcolor='#${base09}'> 󰂰 </span> {volume}%";
          format-bluetooth-muted = "<span color='#${base00}' bgcolor='#${base09}'> 󰂲 </span> {volume}%";
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

      style = with config.lib.stylix.colors; ''
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
          background: #${base00};
          color: #${base06};
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

        #custom-rofi {
          color: #${base00};
          border: 2px solid #${base0E};
          background-color: #${base0E};
          border-radius: 10px;
          padding: 0 6px;
          margin: 5px 0px 5px 0px;
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 16px;
          padding: 0 4px;
          margin: 5px 3px;
          font-weight: 800;
        }

        /* ================================ */
        /*       workspaces module          */
        /* ================================ */
        #workspaces {
          margin: 0px;margin: 5px 0px;
          border: 2px solid #${base06};
          border-radius: 10px;
        }

        #workspaces button {
          color: #${base06};
          padding: 0 2px;
          margin: 5px 3px;
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 12px;
          font-weight: 800;
        }

        #workspaces button:hover {
          color: #${base0E};
        }

        #workspaces button.visible {
          color: #${base00};
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 12px;
          font-weight: 800;
        }

        #workspaces button.visible:hover {
          color: #${base00};
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 12px;
          font-weight: 800;
        }

        #workspaces button.active {
          color: #a5a64e;
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 12px;
          font-weight: 800;
        }

        #workspaces button.active:hover {
          color: #${base0E};
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 12px;
          font-weight: 800;
        }

        #workspaces button.urgent {
          color: #${base08};
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 12px;
          font-weight: 800;
        }

        /* ================================ */
        /*            window                */
        /* ================================ */
        #window {
          font-family: IosevkaTerm Nerd Font Propo;
          font-size: 16px;
          font-weight: 800;
          color: #a9b665;
          padding-right: 4px;margin: 5px 0px;
          border: 2px solid #a9b665;
          border-radius: 10px;
        }

      /* ================================ */
      /*            tray                  */
      /* ================================ */
      #tray {
        margin: 5px 0px;
        padding: 0 6px;
        border: 2px solid #${base06};
        border-radius: 10px;
      }

      /* ================================ */
      /*            disk                  */
      /* ================================ */
      #disk {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #${base0A};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base0A};
        border-radius: 10px;
      }

      /* ================================ */
      /*            cpu                  */
      /* ================================ */
      #cpu {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #${base0B};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base0B};
        border-radius: 10px;
      }
      
      /* ================================ */
      /*             network              */
      /* ================================ */
      #network {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #${base0D};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base0D};
        border-radius: 10px;
      }

      /* ================================ */
      /*            temp                  */
      /* ================================ */
      #temperature {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #d8a657;
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #d8a657;
        border-radius: 3px;
      }

      #temperature.critical {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #cc241d;
        padding-right: 4px;margin: 5px 0px;
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
        color: #${base0C};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base0C};
        border-radius: 10px;
      }

      /* ================================ */
      /*         pulseaudio               */
      /* ================================ */
      #pulseaudio {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #${base09};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base09};
        border-radius: 10px;
      }

      #pulseaudio.muted {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #${base09};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base09};
        border-radius: 10px;
      }

      /* ================================ */
      /*            battery               */
      /* ================================ */
      #battery {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #689d6a;
        padding-right: 4px;
        border: 2px solid #689d6a;
        border-radius: 3px;
      }

      #battery.critical {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #cc241d;
        padding-right: 4px;
        border: 2px solid #cc241d;
        border-radius: 3px;
      }

      #battery.warning {
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 16px;
        font-weight: 800;
        color: #e78a4e;
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
        color: #${base08};
        padding-right: 4px;margin: 5px 0px;
        border: 2px solid #${base08};
        border-radius: 10px;
      }
    '';
  };
}
