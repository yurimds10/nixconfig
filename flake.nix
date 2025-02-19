{
  description = "Yuri's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    # Home manager
    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-stable.url = "github:nix-community/home-manager/release-24.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    # nix-on-droid
    #nix-on-droid.url = "github:nix-community/nix-on-droid/master";
    #nix-on-droid.inputs.nixpkgs.follows = "nixpkgs";
    #nix-on-droid.home-manager.follows = "home-manager-stable";

    # ColorSchemes
    stylix.url = "github:danth/stylix/ed91a20c84a80a525780dcb5ea3387dddf6cd2de";

    # Hyperland / Wayland related flakes
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # Firefox Addons
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    # Minecraft
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    # Configs
    nixvim.url = "github:yurimds10/nixvim";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager-unstable,
    ...
  } @ inputs:
    let
      inherit (self) outputs;
  in {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};

        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      "liveiso" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        
        modules = [
          ./hosts/liveiso/configuration.nix
        ];
      };
    };

    # nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
    #   pkgs = import nixpkgs { system = "aarch64-linux"; };
    #   modules = [ ./hosts/android/configuration.nix ];
    # };

    homeConfigurations = {
      "yurimds@desktop" = home-manager-unstable.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
        };
        
        modules = [
          ./hosts/desktop/home.nix
        ];
      };

      "yurimds@liveiso" = home-manager-unstable.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
        };

        modules = [
          ./hosts/liveiso/home.nix
        ];
      };
    };
  };
}
