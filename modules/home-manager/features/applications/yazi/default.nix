{ pkgs, config, ... }: {
  programs.yazi = {
    enable = true;
    #package = pkgs.yazi.override {
    #  _7zz = (pkgs._7zz.override { useUasm = true; });
    #};
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings =  {
      log = {
        enabled = false;
      };

      manager = {
        show_hidden = true;
        sort_by = "alphabetical";
        sort_dir_first = true;
        sort_translit = false;
        show_symlink = true;
        linemode = "mtime";
        mouse_events = [
          "click"
          "scroll"
        ];
        ratio = [2 3 5];
      };

      tasks = {
        micro_workers = 10;
        macro_workers = 25;
        bizarre_retry = 5;
        image_alloc = 536870912;
        image_bound = [0 0];
        suppress_preload = false;
      };

      confirm = {
        trash_title = "Trash {n} selected file{s}?";
        trash_origin = "center";
        trash_offset = [0 0 70 20];

        delete_title = "Permanently delete {n} selected file{s}?";
        delete_origin = "center";
        delete_offset = [0 0 70 20];

        overwrite_title = "Overwrite file?";
        overwrite_content = "Will overwrite the following file:";
        overwrite_origin = "center";
        overwrite_offset = [0 0 50 15];

        quit_title = "Quit?";
        quit_content = "The following task is still running, are you sure you want to quit?";
        quit_origin = "center";
        quit_offset = [0 1 50 7];
      };

      select = {
        open_title = "Open with:";
        open_origin = "hovered";
        open_offset = [0 1 50 7];
      };

      which = {
        sort_by = "none";
        sort_sensitive = false;
        sort_reverse = false;
        sort_translit = false;
      };
    };

    keymap = {
      manager.keymap = [
        # Go to
        { run = "cd ~"; on = ["g" "c" "d"]; desc = "Go to home directory";}
        { run = "cd ~/.config"; on = ["g" "c" "c"]; desc = "";}
        { run = "cd ~/.dotfiles"; on = ["g" "d" "d"]; desc = "Go to .dotfiles";}
        { run = "cd ~/.fonts"; on = ["g" "f" "f"]; desc = "Go to .fonts";}
        { run = "cd ~/.trash"; on = ["g" "t" "r"]; desc = "Go to .trash";}
        { run = "cd ~/.wallpapers"; on = ["g" "w"]; desc = "Go to .wallpapers";}
        { run = "cd ~/Downloads"; on = [ "g" "D" ]; desc = "Go to Downloads"; }
        { run = "cd ~/Documents"; on = ["g" "d" "c"]; desc = "Go to Documents";}
        { run = "cd ~/Pictures"; on = ["g" "p" "p"]; desc = "Go to Pictures";}
        { run = "cd ~/Projects"; on = ["g" "P"]; desc = "Go to Projects";}
        { run = "cd ~/Pictures/Screenshots"; on = ["g" "p" "s"]; desc = "Go to Screenshots";}
        { run = "cd ~/Videos"; on = ["g" "v"]; desc = "Go to Videos";}

        # Tabs
        { run = "tab_create --current"; on = "<C-t>"; desc = "Create new tab";}
        { run = "tab_switch 0"; on = "1"; desc = "Switch to the first tab";}
        { run = "tab_switch 1"; on = "2"; desc = "Switch to the second tab";}
        { run = "tab_switch 2"; on = "3"; desc = "Switch to the third tab";}
        { run = "tab_switch 3"; on = "4"; desc = "Switch to the fourth tab";}
        { run = "tab_switch 4"; on = "5"; desc = "Switch to the fifth tab";}
        { run = "tab_switch 5"; on = "6"; desc = "Switch to the sixth tab";}
        { run = "tab_switch 6"; on = "7"; desc = "Switch to the seventh tab";}
        { run = "tab_switch 7"; on = "8"; desc = "Switch to the eighth tab";}
        { run = "tab_switch 8"; on = "9"; desc = "Switch to the ninth tab";}
        { run = "tab_switch -1 --relative"; on = "["; desc = "Switch to the previous tab";}
        { run = "tab_switch 1 --relative"; on = "]";  desc = "Switch to the next tab";}
        { run = "tab_swap -1"; on = "{"; desc = "Swap current tab with previous tab";}
        { run = "tab_swap 1"; on = "}"; desc = "Swap current tab with next tab";}

        # Tasks
        { run = "tasks_show"; on = ["t" "s"]; desc = "Show task manager";}

        # Help
        { run = "help"; on = "<F1>"; desc = "Open help";}

        # Misc
        { run = "quit"; on = "q"; desc = "Exit explorer";}
        { run = "hidden toggle"; on = "."; desc = "Toggle visibility of hidden files";}

        # Shell
        { run = "shell --interactive"; on = ";"; desc = "Run a shell command";}
        { run = "shell --block --interactive"; on = ":"; desc = "Run a shell command (block until finishes)";}
        
        # Search | Find | Filter
        { run = "search fd"; on = ["f" "d"]; desc = "Search files by name using fd";}
        { run = "search rg"; on = ["f" "g"]; desc = "Search files by content using ripgrep";}
        { run = "plugin fzf"; on = ["f" "z"]; desc = "Jump to a directory or reveal a file using fzf";}
        { run = "find --smart"; on = "/"; desc = "Find next file";}
        { run = "find --previous --smart"; on = "?"; desc = "Find previous file";}
        { run = "find_arrow"; on = ["f" "n"]; desc = "Go to the next found";}
        { run = "find_arrow --previous"; on = ["f" "N"]; desc = "Go to the previous found";}
        { run = "filter --smart"; on = ["f" "f"]; desc = "Filter files";}

        # Seek
        { run = "seek -5"; on = "K"; desc = "Seek up 5 units in preview";}
        { run = "seek 5"; on = "J"; desc = "Seek down 5 units in preview";}

        # Selection
        { run = "visual_mode"; on = "v"; desc = "Enter visual mode";}
        { run = "visual_mode --unset"; on = "V"; desc = "Enter visual mode";}
        { run = "select_all --state=true"; on = "<C-a>"; desc = "Select all";}
        { run = "select_all --state=none"; on = "<C-r>"; desc = "Unselect all";}

        # Navigation
        { run = "leave"; on = "h"; desc = "Move right";}
        { run = "enter"; on = "l"; desc = "Move left";}
        { run = "arrow -1"; on = "k"; desc = "Move up";}
        { run = "arrow 1"; on = "j"; desc = "Move down";}
        { run = "leave"; on = "<Left>"; desc = "Move left";}
        { run = "enter"; on = "<Right>"; desc = "Move right";}
        { run = "arrow -1"; on = "<Up>"; desc = "Move up";}
        { run = "arrow 1"; on = "<Down>"; desc = "Move down";}
        { run = "arrow -50%"; on = "<C-k>"; desc = "Move down by half";}
        { run = "arrow 50%"; on = "<C-j>"; desc = "Move up by half";}
        { run = "arrow -99999999"; on = ["g" "g"]; desc = "Move to top";}
        { run = "arrow 99999999"; on = "G"; desc = "Move to bottom";}

        # Copy | Cut | Delete | Create | Rename | Filter | Open
        { run = "open"; on = ["e" "e"]; desc = "Open selected file(s)";}
        { run = "open --interactive"; on = ["e" "E"]; desc = "Open selected file(s) interactively";}
        { run = "yank"; on = ["y" "y"]; desc = "Copy file(s)";}
        { run = "yank --cut"; on = [ "d" "d"]; desc = "Cut file(s)";}
        { run = "copy path"; on = ["c" "c"]; desc = "Copy the file path";}
        { run = "copy dirname"; on = ["c" "p"]; desc = "Copy the file directory path";}
        { run = "copy filename"; on = ["c" "f"]; desc = "Copy the filename";}
        { run = "copy name_without_ext"; on = ["c" "n"]; desc = "Copy the filename without the extension";}
        { run = "paste"; on = [ "p" "p" ]; desc = "Paste file(s)";}
        { run = "paste --force"; on = ["p" "P"]; desc = "Overwrite paste file(s)";}
        { run = "remove"; on = ["d" "t"]; desc = "Trash selected file(s)";}
        { run = "remove --w permanently"; on = ["d" "D"]; desc = "Delete selected file(s)";}
        { run = "create"; on = ["m" "k"]; desc = "Create a file (ends with / for directories)";}
        { run = "rename --cursor=before_ext"; on = ["r" "r"]; desc = "Rename selected file(s)";}

        # Sorting
        { run = [ "sort modified --reverse=no" "linemode mtime" ]; on = [ ";" "m" ]; desc = "Sort by modified time";}
        { run = [ "sort modified --reverse" "linemode mtime" ]; on = [ ";" "M" ]; desc = "Sort by modified time (reverse)"; }
        { run = [ "sort created --reverse=no" "linemode ctime" ]; on = [ ";" "c" ]; desc = "Sort by created time"; }
        { run = [ "sort created --reverse" "linemode ctime" ]; on = [ ";" "C" ]; desc = "Sort by created time (reverse)"; }
        { run = "sort extension --reverse=no"; on = [ ";" "e" ]; desc = "Sort by extension"; }
        { run = "sort extension --reverse"; on = [ ";" "E" ]; desc = "Sort by extension (reverse)"; }
        { run = "sort alphabetical --reverse=no"; on = [ ";" "a" ]; desc = "Sort alphabetically"; }
        { run = "sort alphabetical --reverse"; on = [ ";" "A" ]; desc = "Sort alphabetically (reverse)"; }
        { run = "sort natural --reverse=no"; on = [ ";" "n" ]; desc = "Sort naturally"; }
        { run = "sort natural --reverse"; on = [ ";" "N" ]; desc = "Sort naturally (reverse)"; }
        { run = [ "sort size --reverse=no" "linemode size" ]; on = [ ";" "s" ]; desc = "Sort by size"; }
        { run = [ "sort size --reverse" "linemode size" ]; on = [ ";" "S" ]; desc = "Sort by size (reverse)"; }
        { run = "sort random --reverse=no"; on = [ ";" "r" ]; desc = "Sort randomly"; }
      ];
    };
  };
}
