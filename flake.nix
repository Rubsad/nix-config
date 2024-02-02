{
  description = "Sample Nix Config";

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    username = "rubsad";
    x64_linux = "x86_64-linux";
    systems = [x64_linux];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    nixosSystem = import ./lib/nixosSystem.nix;

    uwuki-modules = {
      nixos-modules = [
        ./host
      ];
      home-module = import ./home/uwuki.nix;
    };

    x64_specialArgs =
      {
        inherit username;
        pkgs-unstable = import nixpkgs-unstable {
          system = x64_linux;
          config.allowUnfree = true;
        };
      } // inputs;
  in {
    nixosConfigurations = let
      base-args = {
        inherit home-manager;
        nixpkgs = nixpkgs;
        system = "x86_64-linux";
        specialArgs = x64_specialArgs;
      };
    in {
      uwuki = nixosSystem ( uwuki-modules // base-args );
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprsome.url = "github:sopa0/hyprsome";
    hyprsome.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org"
    ];
  };
}
