{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    package = pkgs.neovim-unwrapped;

    plugins = with pkgs; [vimPlugins.nvim-treesitter.withAllGrammars];

    extraPackages = with pkgs; [
      angular-language-server

      nodePackages.typescript-language-server
      nodePackages.prettier

      tailwindcss-language-server

      lua-language-server # Lua LSP
      stylua # Lua code formatter

      marksman
      markdownlint-cli2

      alejandra
      nil

      llvmPackages_17.clang-tools

      jdt-language-server
    ];
  };

  #xdg.configFile.nvim = {
  #source =
  #  config.lib.file.mkOutOfStoreSymlink "~/.config/nvim";
  #  recursive = true;
  #};
}
