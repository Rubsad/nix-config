{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/users.nix
    ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "uwuki";
    networkmanager.enable = true;
  };

  system.stateVersion = "23.11";
}