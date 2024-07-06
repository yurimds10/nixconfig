{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/desktop/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };

    homeConfigurations = {
      "yurimds" = inputs.home-manager.lib.homeManagerConfiguration {
        # Specify the host architecture
        pkgs = nixpkgs.legacyPackages."x86_64-linux";

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./hosts/desktop/home.nix ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
