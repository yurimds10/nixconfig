{ pkgs, lib, inputs, ...}:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
      multiplayer = {
        enable = true;
        packages = pkgs.vanillaServers.vanilla-1_21;
      };
    };
  };
}
