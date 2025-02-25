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
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nvf,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    username = "colin";
  in {
    nixosConfigurations = {
      yoga = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./nixos/configuration.nix
          ./modules
          nvf.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.colin = import ./home/home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs system username;
            };
          }
          stylix.nixosModules.stylix
        ];
      };
    };
  };
}
