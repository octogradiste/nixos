{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "colin";
    in
    {
      nixosConfigurations = {
        yoga = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.colin = import ./home/home.nix;
              home-manager.sharedModules = [ stylix.homeModules.stylix ];
              home-manager.extraSpecialArgs = {
                inherit inputs system username;
              };
              home-manager.backupFileExtension = "bak";
            }
          ];
        };
      };
    };
}
