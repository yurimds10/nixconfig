{ ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = "no";
      cursor_text_color = "background";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "disabled";
      disable_ligatures = "never";
      editor = "nvim";
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