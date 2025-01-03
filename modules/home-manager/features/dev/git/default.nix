{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "coder73854@proton.me";
    userName = "Yuri Mendes";

    extraConfig = {
      safe = {
        directory = [
          "~/.config/Nix"
          "~/Documents/Projects/Repositories"
          "~/Documents/Studies/Programming/Repositories"
          "~/Documents/Studies/Obsidian-Notes"
        ];
      };
    };
  };
}
