{ lib, config, ... }: 
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = lib.concatStrings [
        "[](color_aqua)"
        "$os"
        "[](bg:color_blue fg:color_aqua)"
        "$username"
        "[](fg:color_blue bg:color_fg0)"
        "$directory"
        "[](fg:color_fg0 bg:color_purple)"
        "$git_branch"
        "$git_status"
        "[](fg:color_purple bg:color_green)"
        "$nix_shell"
        "[](fg:color_green bg:color_bg1)"
        "$cmd_duration"
        "[](fg:color_bg1) "
      ];

      palette = "gruvbox_dark";
      palettes.gruvbox_dark = with config.colorScheme.palette; {
        color_fg0 = "#${base06}";
        color_fg1 = "#${base04}";
        color_bg1 = "#${base03}";
        color_bg3 = "#${base04}";
        color_blue = "#${base0D}";
        color_aqua = "#${base0C}";
        color_green = "#${base0B}";
        color_orange = "#${base09}";
        color_purple = "#${base0E}";
        color_red = "#${base08}";
        color_yellow = "#${base0A}";
      };

      os = {
        disabled = false;
        style = "bg:color_aqua bold fg:color_fg0";
        symbols = {
          NixOS = " ";
        };
      };

      username = {
        disabled = false;
        show_always = true;
        style_user = "bg:color_blue fg:color_fg0";
        style_root = "bg:color_red fg:color_fg1";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "bold fg:color_bg1 bg:color_fg0";
        format = "[ $path ]($style)";
        truncation_length = 3;
      };

      git_branch = {
        symbol = "";
        style = "bg:color_purple";
        format = "[[ $symbol $branch ](bold fg:color_fg0 bg:color_purple)]($style)";
      };

      git_status = {
        style = "bg:color_purple bold fg:color_fg0";
        format = "[$all_status$ahead_behind]($style)";
      };
      
      nix_shell = {
        format = "[ via nix $name ]($style)";
        style = "bg:color_green bold fg:color_fg0";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bg1";
        format = "[[   $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      cmd_duration = {
        format = "[ 󰔛 $duration ]($style)";
        disabled = false;
        style = "bg:color_bg1 fg:color_fg0";
        show_notifications = false;
        min_time_to_notify = 60000;
      };

      line_break = {
        disabled = false;
      };

      character = lib.mkDefault {
        disabled = false;
        success_symbol = "[  ](bold fg:color_green)";
        error_symbol = "[  ](bold fg:color_red)";
      };
    };
  };
}
