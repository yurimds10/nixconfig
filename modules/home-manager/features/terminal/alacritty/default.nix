{ config, ... }: {
  programs.alacritty = with config.colorScheme.palette; {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#${base00}";
          foreground = "#${base06}";
        };

        normal = {
          black = "#1d2021";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };

        bright = {
          black = "#a89984";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#fff4d2";
        };
      };
      #font = {
      #  size = 14;

      #  offset.x = 0;
      #  offset.y = 0;

      #  glyph_offset.x = 0;
      #  glyph_offset.y = 0;

      #  normal = {
      #    family = "IosevkaTerm Nerd Font Mono";
      #    style = "SemiBold";
      #  };

      #  bold = {
      #    family = "IosevkaTerm Nerd Font Mono";
      #    style = "ExtraBold";
      #  };

      #  italic = {
      #    family = "IosevkaTerm Nerd Font Mono";
      #    style = "SemiBold Italic";
      #  };

      #  bold_italic = {
      #    family = "IosevkaTerm Nerd Font Mono";
      #    style = "ExtraBold Italic";
      #  };
      #};
    };
  };
}
