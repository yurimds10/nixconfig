{
  description = "Yuri's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
     home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # grub2 theme
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    grub2-themes.inputs.nixpkgs.follows = "nixpkgs";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    # AGS
    #ags.url = "github:Aylur/ags";
    ags.url = "github:aylur/ags/v1";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-colors,
    firefox-addons,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};

        modules = [
          ./hosts/desktop/configuration.nix
          inputs.spicetify-nix.nixosModules.default
          inputs.grub2-themes.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      "yurimds@desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
          inherit outputs;
        };
        
        modules = [
          ./hosts/desktop/home.nix
            #inputs.spicetify-nix.homeManagerModules.default
            inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
  };
}
