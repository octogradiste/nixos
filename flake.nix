{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    stylix,
    ...
  }: {
    nixosConfigurations = {
      yoga = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          ./modules
          nvf.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            # Enables installation of user packages through the users.users.<name>.packages option.
            home-manager.useUserPackages = true;
            home-manager.users.colin = import ./home/home.nix;
          }
          stylix.nixosModules.stylix
        ];
      };
    };
  };
}
