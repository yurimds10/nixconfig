{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../config/nvchad/default.nix
  ];

  home.packages = with pkgs; [
    vscode
    jetbrains.idea-community

    # Containers
    postman

    # JavaScript/TypeScript
    nodejs_22
    bun
    typescript

    # Scss
    #dart-scss

    # C/C++
    libgcc
    ccls

    # Nix
    nixd
    alejandra

    llvm_18
    go
    python3
    openjdk
    rustc
  ];
}
