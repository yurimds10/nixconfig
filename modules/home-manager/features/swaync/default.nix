{ config, ... }:
{
  services.swaync = {
    enable = true;
    ## https://github.com/Frost-Phoenix/nixos-config/blob/4d75ca005a820672a43db9db66949bd33f8fbe9c/modules/home/swaync/config.json
        settings = {
          positionX = "right";
          positionY = "top";
          layer = "overlay";
          layer-shell = true;
          cssPriority = "application";
          control-center-margin-top = 6;
          control-center-marging-bottom = 6;
          control-center-margin-left = 6;
          control-center-margin-right = 6;
          notification-icon-size = 64;
          notification-body-image-height = 128;
          notification-body-image-width = 200;
          notification-2fa-action = true;
          timeout = 10;
          timeout-low = 5;
          timeout-critical = 0;
          fit-to-screen = true;
          control-center-width = 400;
          control-center-height = 650;
          notification-window-width = 350;
          keyboard-shortcuts = true;
          image-visibility = "when-available";
          transition-time = 200;
          hide-on-clear = false;
          hide-on-action = true;
          script-fail-notify = true;
          widgets = [
            "title"
            "menubar#desktop"
            "volume"
            "backlight#mobile"
            "mpris"
            "dnd"
            "notifications"
          ];
          widget-config = {
            title = {
              text = "Control Center";
              clear-all-buttons = true;
              botton-text = " Clear Everything ";
            };
            "menubar#desktop" = {
              "menu#screenshot" = {
                label = "󰄀 ";
                position = "left";
                actions = [
                  {
                    label = "  Full Screen";
                    action = "";
                  }
                  {
                    label = "  Area";
                    action = "";
                  }
                ];
              };
              "menu#record" = {
                label = " ";
                position = "left";
                actions = [
                  {
                    label = "  Record Full Screen";
                    command = "";
                  }
                  {
                    label = "󰩭 Record Area";
                    command = "";
                  }
                  {
                    label = "󰵸 Record GIF";
                    command = "";
                  }
                  {
                    label = " stop Recording";
                    command = "";
                  }
                ];
              };
              "menu#power-buttons" = {
                label = " ";
                position = "left";
                actions = [
                  {
                    label = " Lock Session";
                    command = "swaylock";
                  }
                  {
                    label = "  Reboot";
                    command = "systemctl reboot";
                  }
                  {
                    label = "  Shutdown";
                    command = "systemctl poweroff";
                  }
                ];
              };
            };
            "backlight#mobile" = {
              label = " ";
              device = "panel";
            };
            volume = {
              label = "  ";
              expand-button-label = "";
              colapse-button-label = "";
              show-per-app = true;
              show-per-app-label = false;
            };
            dnd = {
              text = " Silence";
            };
            mpris = {
              iamge-size = 85;
              image-radius = 5;
            };
          };
        };

        ## https://github.com/catppuccin/swaync
        style = with config.colorScheme.palette; ''
          * {
            all: unset;
            font-size: 10px;
            font-family: "0xProto Nerd Font";
            transition: 200ms;
          }

          trough highlight {
            background: #${base06};
          }

          scale trough {
            margin: 0rem 1rem;
            background-color: #${base00};
            min-height: 8px;
            min-width: 70px;
          }

          slider {
            background-color: #${base0A};
          }

          .floating-notifications.background .notification-row .notification-background {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #363a4f;
            border-radius: 12.6px;
            margin: 18px;
            background-color: #${base00};
            color: #${base06};
            padding: 0;
          }

          .floating-notifications.background .notification-row .notification-background .notification {
            padding: 7px;
            border-radius: 12.6px;
          }

          .floating-notifications.background .notification-row .notification-background .notification.critical {
            box-shadow: inset 0 0 7px 0 #${base0C};
          }

          .floating-notifications.background .notification-row .notification-background .notification .notification-content {
            margin: 7px;
          }

          .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
            color: #${base06};
          }

          .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
            color: #${base06};
          }

          .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
            color: #${base06};
          }

          .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
            min-height: 3.4em;
          }

          .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
            border-radius: 7px;
            color: #${base06};
            background-color: #${base01};
            box-shadow: inset 0 0 0 1px #${base02};
            margin: 7px;
          }

          .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
            box-shadow: inset 0 0 0 1px #${base02};
            background-color: #${base00};
            color: #${base06};
          }

          .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
            box-shadow: inset 0 0 0 1px #${base01};
            background-color: #${base0D};
            color: #${base06};
          }

          .floating-notifications.background .notification-row .notification-background .close-button {
            margin: 7px;
            padding: 2px;
            border-radius: 6.3px;
            color: #${base00};
            background-color: #${base0C};
          }

          .floating-notifications.background .notification-row .notification-background .close-button:hover {
            background-color: #${base0C};
            color: #${base00};
          }

          .floating-notifications.background .notification-row .notification-background .close-button:active {
            background-color: #${base0C};
            color: #${base00};
          }

          .control-center {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.8), inset 0 0 0 1px #363a4f;
            border-radius: 12.6px;
            margin: 18px;
            background-color: #24273a;
            color: #cad3f5;
            padding: 14px;
          }

          .control-center .widget-title > label {
            color: #cad3f5;
            font-size: 1.3em;
          }

          .control-center .widget-title button {
            border-radius: 7px;
            color: #cad3f5;
            background-color: #363a4f;
            box-shadow: inset 0 0 0 1px #494d64;
            padding: 8px;
          }

          .control-center .widget-title button:hover {
            box-shadow: inset 0 0 0 1px #494d64;
            background-color: #5b6078;
            color: #${base06};
          }

          .control-center .widget-title button:active {
            box-shadow: inset 0 0 0 1px #494d64;
            background-color: #7dc4e4;
            color: #24273a;
          }

          .control-center .notification-row .notification-background {
            border-radius: 7px;
            color: #${base06};
            background-color: #363a4f;
            box-shadow: inset 0 0 0 1px #494d64;
            margin-top: 14px;
          }

          .control-center .notification-row .notification-background .notification {
            padding: 7px;
            border-radius: 7px;
          }

          .control-center .notification-row .notification-background .notification.critical {
            box-shadow: inset 0 0 7px 0 #ed8796;
          }

          .control-center .notification-row .notification-background .notification .notification-content {
            margin: 7px;
          }

          .control-center .notification-row .notification-background .notification .notification-content .summary {
            color: #${base06};
          }

          .control-center .notification-row .notification-background .notification .notification-content .time {
            color: #${base06};
          }

          .control-center .notification-row .notification-background .notification .notification-content .body {
            color: #${base06};
          }

          .control-center .notification-row .notification-background .notification > *:last-child > * {
            min-height: 3.4em;
          }

          .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
            border-radius: 7px;
            color: #${base06};
            background-color: #181926;
            box-shadow: inset 0 0 0 1px #494d64;
            margin: 7px;
          }

          .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
            box-shadow: inset 0 0 0 1px #494d64;
            background-color: #363a4f;
            color: #${base06};
          }

          .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
            box-shadow: inset 0 0 0 1px #494d64;
            background-color: #7dc4e4;
            color: #${base06};
          }

          .control-center .notification-row .notification-background .close-button {
            margin: 7px;
            padding: 2px;
            border-radius: 6.3px;
            color: #24273a;
            background-color: #ee99a0;
          }

          .close-button {
            border-radius: 6.3px;
          }

          .control-center .notification-row .notification-background .close-button:hover {
            background-color: #ed8796;
            color: #24273a;
          }

          .control-center .notification-row .notification-background .close-button:active {
            background-color: #ed8796;
            color: #24273a;
          }

          .control-center .notification-row .notification-background:hover {
            box-shadow: inset 0 0 0 1px #494d64;
            background-color: #8087a2;
            color: #${base06};
          }

          .control-center .notification-row .notification-background:active {
            box-shadow: inset 0 0 0 1px #494d64;
            background-color: #7dc4e4;
            color: #${base06};
          }

          .notification.critical progress {
            background-color: #ed8796;
          }

          .notification.low progress,
          .notification.normal progress {
            background-color: #${base0D};
          }

          .control-center-dnd {
            margin-top: 5px;
            border-radius: 8px;
            background: #363a4f;
            border: 1px solid #494d64;
            box-shadow: none;
          }

          .control-center-dnd:checked {
            background: #363a4f;
          }

          .control-center-dnd slider {
            background: #494d64;
            border-radius: 8px;
          }

          .widget-dnd {
            margin: 0px;
            font-size: 1.1rem;
          }

          .widget-dnd > switch {
            font-size: initial;
            border-radius: 8px;
            background: #363a4f;
            border: 1px solid #494d64;
            box-shadow: none;
          }

          .widget-dnd > switch:checked {
            background: #363a4f;
          }

          .widget-dnd > switch slider {
            background: #494d64;
            border-radius: 8px;
            border: 1px solid #6e738d;
          }

          .widget-mpris .widget-mpris-player {
            background: #363a4f;
            padding: 7px;
          }

          .widget-mpris .widget-mpris-title {
            font-size: 1.2rem;
          }

          .widget-mpris .widget-mpris-subtitle {
            font-size: 0.8rem;
          }

          .widget-menubar > box > .menu-button-bar > button > label {
            font-size: 3rem;
            padding: 0.5rem 2rem;
          }

          .widget-menubar > box > .menu-button-bar > :last-child {
            color: #ed8796;
          }

          .power-buttons button:hover,
          .powermode-buttons button:hover,
          .screenshot-buttons button:hover {
            background: #363a4f;
          }

          .control-center .widget-label > label {
            color: #${base06};
            font-size: 2rem;
          }

          .widget-buttons-grid {
            padding-top: 1rem;
          }

          .widget-buttons-grid > flowbox > flowboxchild > button label {
            font-size: 2.5rem;
          }

          .widget-volume {
            padding-top: 1rem;
          }

          .widget-volume label {
            font-size: 1.5rem;
            color: #7dc4e4;
          }

          .widget-volume trough highlight {
            background: #7dc4e4;
          }

          .widget-backlight trough highlight {
            background: #eed49f;
          }

          .widget-backlight label {
            font-size: 1.5rem;
            color: #eed49f;
          }

          .widget-backlight .KB {
            padding-bottom: 1rem;
          }

          .image {
            padding-right: 0.5rem;
          }
        '';
  };
}