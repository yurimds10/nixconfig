{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    font = lib.mkDefault {
      name = "JetBrainsMono Nerd Font";
      size = 10.5;
    };
    settings = {  
      enable_audio_bell = "no";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "true";
      disable_ligatures = "never";
      editor = "nvim";

      font_family = lib.mkDefault "JetBrainsMonoNF-Bold";
      adjust_line_height = 3;
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
