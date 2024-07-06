{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    jetbrains.idea-community
    jetbrains.pycharm-community

    nodejs_22
    typescript
    jdk22
    rustc
    libgcc
    go
    python3
  ];
}