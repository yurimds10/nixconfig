{ pkgs, config, ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit 0";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
    ];

    style = with config.colorScheme.palette; ''
      window {
          font-family: monospace;
          font-size: 14pt;
          color: #${base06}; /* text */
          background-color: rgba(30, 30, 46, 0.5);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: rgba(30, 30, 46, 0);
          margin: 5px;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: rgba(49, 50, 68, 0.1);
      }

      button:focus {
          background-color: #${base0A};
          color: #${base00};
        }

      #lock {
          background-image: url("${/. + ./assets/lock.png}");
      }
      #lock:focus {
          background-image: url("${/. + ./assets/lock-hover.png}");
      }

      #logout {
          background-image: url("${/. + ./assets/logout.png}");
      }

      #logout:focus {
          background-image: url("${/. + ./assets/logout-hover.png}");
      }

      #suspend {
          background-image: url("${/. + ./assets/sleep.png}");
      }

      #suspend:focus {
          background-image: url("${/. + ./assets/sleep-hover.png}");
      }

      #shutdown {
          background-image:url("${/. + ./assets/power.png}");
      }

      #shutdown:focus {
          background-image: url("${/. + ./assets/power-hover.png}");
      }

      #reboot {
          background-image: url("${/. + ./assets/restart.png}");
      }

      #reboot:focus {
          background-image: url("${/. + ./assets/restart-hover.png}");
      }
    '';
  };
}
