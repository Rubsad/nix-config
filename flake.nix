{
  description = "Sample Nix Config";

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    nixosSystem = import ./lib/nixosSystem.nix;

    uwuki-modules = {
      nixos-modules = [
        ./hosts/uwuki
      ];
      home-module = import ./home/uwuki.nix;
    };
  in {
    nixosConfigurations = let
      base-args = {
        inherit home-manager;
        nixpkgs = nixpkgs;
        system = "x86_64-linux";
        specialArgs = inputs;
      };
    in {
      uwuki = nixosSystem ( uwuki-modules // base-args );
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org"
    ];
  };
}