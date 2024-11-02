{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    vscode
    jetbrains.idea-community

    # JavaScript/TypeScript
    nodejs_22
    typescript

    # C/C++
    libgcc
    ccls

    # Nix
    nixd
    alejandra

    llvm_18
    go
    python3
    jdk22
    rustc
  ];
}