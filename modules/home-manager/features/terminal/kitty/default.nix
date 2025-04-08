{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    font = lib.mkDefault {
      name = "FantasqueSansM Nerd Font";
      size = 13;
    };
    settings = {  
      enable_audio_bell = "no";
      allow_remote_control = "yes";
      background_opacity = lib.mkDefault "0.8";
      cursor_trail = "1";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "true";
      disable_ligatures = "never";
      editor = "nvim";

      font_family = lib.mkDefault "FantasqueSansM Nerd Font Medium";
      adjust_line_height = 3;

      background = "#1d2021";
      foreground = "#d4be98";

      selection_background = "#d4be98";
      selection_foreground = "#1d2021";

      cursor = "#a89984";
      cursor_text_color = "background";

      # Black
      color0 = "#665c54";
      color8 = "#928374";

      # Red
      color1 = "#ea6962";
      color9 = "#ea6962";

      # Green
      color2  = "#a9b665";
      color10 = "#a9b665";

      # Yellow
      color3  = "#e78a4e";
      color11 = "#d8a657";

      # Blue
      color4  = "#7daea3";
      color12 = "#7daea3";

      # Magenta
      color5  = "#d3869b";
      color13 = "#d3869b";

      # Cyan
      color6  = "#89b482";
      color14 = "#89b482";

      # White
      color7  = "#d4be98";
      color15 = "#d4be98";
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
