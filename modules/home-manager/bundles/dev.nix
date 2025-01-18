{ pkgs, inputs, ...}:
{
  imports = [
    ../features/dev/git/default.nix
    ../features/dev/vscodium/default.nix
  ];

  home.packages = with pkgs; [
    inputs.nixvim.packages.x86_64-linux.default

    jetbrains.idea-community

    # Containers
    postman

    # JavaScript/TypeScript
    nodejs_22
    typescript
    deno

    # CSS
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
    jdk23
    rustc
  ];
}
