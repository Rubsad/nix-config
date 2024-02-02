{ config, pkgs, ... } @ args:
{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/core.nix
    ../modules/nixos/desktop.nix
    ../modules/nixos/users.nix
  ];

  fileSystems = {
    "/".options = ["discard=async" "compress=zstd"];
    "/home".options = ["discard=async" "compress=zstd"];
    "/nix".options = ["discard=async" "compress=zstd" "noatime"];
    "/files".options = ["uid=1000" "dmask=0022" "fmask=0113" "nofail"];
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;

  zramSwap.enable = true;

  networking = {
    hostName = "uwuki";
    networkmanager.enable = true;
    enableIPv6 = true;
  };

  services.power-profiles-daemon.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  services.goxlr-utility = {
    enable = true;
  };

  system.stateVersion = "23.11";
}
