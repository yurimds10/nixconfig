{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
        padding = {
          top = 1;
        };
      };

      display = {
        separator = "";
        key = {
          width = 15;
        };
      };

      modules = [
        {
          type = "custom";
          key = "╭───────────╮";
        }
        {
          # draw borders first to make colors of left and right border consistant
          key = ''│           │\u001b[11D\u001b[31m user'';
          type = "title";
          format = "{1}";
        }
        {
          key = ''│           │\u001b[11D\u001b[32m󰇅 hname'';
          type = "title";
          format = "{2}";
        }
        {
          key = ''│           │\u001b[11D\u001b[33m󰅐 uptime'';
          type = "uptime";
        }
        {
          key = ''│           │\u001b[11D\u001b[35m kernel'';
          type = "kernel";
        }
        {
          key = ''│           │\u001b[11D\u001b[36m󰇄 wm'';
          type = "wm";
        }
        {
          key = ''│           │\u001b[11D\u001b[31m term'';
          type = "terminal";
        }
        {
          key = ''│           │\u001b[11D\u001b[32m shell'';
          type = "shell";
        }
        {
          key = ''│           │\u001b[11D\u001b[33m󰍛 cpu'';
          type = "cpu";
        }
        {
          key = ''│           │\u001b[11D\u001b[34m󰉉 disk'';
          type = "disk";
          folders = "/";
        }
        {
          key = ''│           │\u001b[11D\u001b[35m memory'';
          type = "memory";
        }
        {
          key = ''│           │\u001b[11D\u001b[31m󱦟Age'';
	        type = "command";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          key = "├───────────┤";
          type = "custom";
        }
        {
          key = ''│           │\u001b[11D\u001b[m colors'';
          type = "colors";
          symbol = "circle";
        }
        {
          key = "╰───────────╯";
          type = "custom";
        }
      ];
    };
  };
}
