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

    # ColorSchemes
    stylix.url = "github:danth/stylix/ed91a20c84a80a525780dcb5ea3387dddf6cd2de";
    nix-colors.url = "github:misterio77/nix-colors";

    # Hyprland / Wayland related flakes
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # Hyprpanel
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";

    # Firefox Addons
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Minecraft
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    yt-x.url = "github:Benexl/yt-x";

    # Configs
    #nixvim.url = "github:yurimds10/nvim";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager-unstable,
    nix-colors,
    hyprpanel,
    ...
  }@ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
    in {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };

        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };

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
    };
  };
}
