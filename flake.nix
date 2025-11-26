{
  description = "NixOS System Flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs-stable = import nixpkgs-stable {
        system = "x86_64-linux";
        config = { allowUnfree = true; android_sdk.accept_license = true; };
      };
    in {
      nixosConfigurations = {
        nyx = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/nyx
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.jake = ./home/jake.nix;
            }
          ];
          specialArgs = {
            inherit pkgs-stable;
          };
        };
      };
    };
}
