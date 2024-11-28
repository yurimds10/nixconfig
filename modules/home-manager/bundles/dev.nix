{ pkgs, inputs, ...}:
{
  imports = [
    ../features/nixvim/default.nix
    ../features/vscodium/default.nix
  ];

  home.packages = with pkgs; [
    #inputs.nixvim.packages.x86_64-linux.default

    #vscode
    jetbrains.idea-community

    # Containers
    postman

    # JavaScript/TypeScript
    nodejs_22
    bun
    typescript

    # Scss
    sassc

    # C/C++
    libgcc
    ccls
    gcc

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
