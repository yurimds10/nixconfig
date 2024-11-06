{
  inputs,
  pkgs,
  ...
}: {
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
          history | uniq | ${pkgs.fzf}/bin/fzf
        '';
      };
    };

    shellInit = ''
      set fish_greeting

      set -x EDITOR nvim

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
      dotfiles = "nvim $HOME/dotfiles/";
      nixconfig = "nvim $HOME/nixconfig/";
      neovim = "nvim $HOME/Dev/neovim";

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
  };
}
