{ pkgs, ... }:
{
  home.packages = with pkgs; [
    grc
  ];

  programs.fish = {
    enable = true;

    functions = {
      # lfcd = {
      #   body = ''
      #     cd "$(command lf -print-last-dir $argv)"
      #   '';
      # };

      hst = {
        body = ''
          history | uniq | ${pkgs.fzf}/bin/fzf | ${pkgs.wl-clipboard}/bin/wl-copy -n
        '';
      };
    };

    shellInit = ''
      set fish_greeting

      set -x EDITOR nvim

      starship init fish
    '';

    shellAliases = {
      # settings for common commands
      c = "clear";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -vI";
      bc = "bc -ql";
      mkd = "mkdir -pv";
      ls = "eza --icons --group-directories-first";
      locate = "plocate";
      tp = "trash-put";
      tpr = "trash-restore";
      cat = "bat";
      grep = "grep --color=always";

      vim = "nvim";
      vi = "nvim";

      nixconfig = "nvim $HOME/.config/nix/nixconfig/";
      neovim = "nvim $HOME/.config/nix/nixvim/";

      projects = "cd ~/Documents/Projects/Repositories/";
      studies = "cd ~/Documents/Study/Programming/Repositories/";

      gcl = "git clone";
      gs = "git status";
      gadd = "git add";
      gc = "git commit -m";
      gpull = "git pull";
      gpush = "git push";
      gb = "git branch";
    };

    # setup vi mode
    interactiveShellInit = ''
      fish_vi_key_bindings
    '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];
  };
}
