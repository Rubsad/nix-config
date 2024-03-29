{
  nixpkgs,
  home-manager,
  system,
  specialArgs,
  nixos-modules,
  home-module,
}: let
  inherit (specialArgs) username;
in
  nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules =
      nixos-modules
      ++ [
        {
          nix.registry.nixpkgs.flake = nixpkgs;
          environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
          nix.nixPath = ["/etc/nix/inputs"];
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.rubsad = home-module;
        }
      ];
  }
