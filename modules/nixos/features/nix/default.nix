{ config, inputs, lib, ... }:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;

      #extra-substituters = [ "https://yazi.cachix.org" ];
      #extra-trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];

      #system-features = [ "nixos-test" "benchmark" "big-parallel" "kvm" "gccarch-kentsfield" ];
    };

    channel.enable = false;

    #registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    #nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  nixpkgs = {
    overlays = [];

    config = {
      allowUnfree = true;
    };

    #hostPlatform = {
    # gcc.arch = "kentsfield";
    # gcc.tune = "kentsfield";
    # system = "x86_64-linux";
    #};

    #buildPlatform = {
    #  gcc.arch = "kentsfield";
    #  gcc.tune = "kentsfield";
    #  system = "x86_64-linux";
    #};
  };

  system.stateVersion = "24.11";
}
