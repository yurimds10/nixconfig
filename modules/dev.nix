{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    vscode
    jetbrains.idea-community

    nodejs_22
    typescript
    jdk22
    rustc
    libgcc
    go
    python3

    # Nix
    nixd
    alejandra
  ];
}
