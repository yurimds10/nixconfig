{
  pkgs,
  config,
  nix-colors,
  ...
}: {
  programs.kitty = {
    enable = true;
    settings = with config.colorScheme.palette; {
      enable_audio_bell = "no";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "disabled";
      disable_ligatures = "never";
      editor = "nvim";

      cursor = "#${base06}";
      cursor_text_color = "background";

      url_color = "#${base0D}";

      visual_bell_color = "#${base0C}";
      bell_border_color = "#${base0C}";

      active_border_color = "#${base0E}";
      inactive_border_color = "#${base03}";

      foreground = "#${base06}";
      background = "#${base00}";
      selection_foreground = "#${base02}";
      selection_background = "#${base06}";

      active_tab_foreground = "#${base06}";
      active_tab_background = "#${base03}";
      inactive_tab_foreground = "#${base04}";
      inactive_tab_background = "#${base01}";

      # = "black  (bg3/bg4)";
      color0 = "#${base03}";
      color8 = "#${base04}";

      # = "red";
      color1 = "#${base08}";
      color9 = "#${base08}";

      #: = "green";
      color2 = "#${base0B}";
      color10 = "#${base0B}";

      # = "yellow";
      color3 = "#${base0A}";
      color11 = "#${base0A}";

      # = "blue";
      color4 = "#${base0D}";
      color12 = "#${base0D}";

      # = "purple";
      color5 = "#${base0E}";
      color13 = "#${base0E}";

      # = "aqua";
      color6 = "#${base0C}";
      color14 = "#${base0C}";

      # = "white (fg4/fg3)";
      color7 = "#${base05}";
      color15 = "#${base06}";
    };

    extraConfig = ''
      #: map kitty_mod+c copy_to_clipboard
      #: map ctrl+v paste_from_clipboard
      map kitty_mod+q close_window
      map kitty_mod+d next_window
      map kitty_mod+a previous_window
      map kitty_mod+w move_window_forward
      map kitty_mod+s move_window_backward
      map kitty_mod+z new_tab
      map kitty_mod+x close_tab
    '';
  };
}
