{ config, pkgs, ... }:
{
  imports = [./hardware-configuration.nix];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  network = {
    hostname = "uwuki";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    trusted-users = ["rubsad"];
    experimental.features = ["nix-command" "flakes"];
    auto-optimize-store = true;
  };

  time.timezone = "Europe/Helsinki";

  i18.defaultLocale = "en_US.UTF-8";
  i18.extraLocaleSettings = {
    LC_TIME = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_ADRESS = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
  };

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = false;
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  environment.systemPackages = with pkgs; [
    nano
    curl
    wget
    git
  ];

  environment.variables.EDITOR = "nano";

  users.group.rubsad = {};

  users.users.rubsad = {
    hashedPassword = "";
    home = "/home/rubsad";
    isNormalUser = true;
    extraGroups = [
      "rubsad"
      "users"
      "networkmanager"
      "wheel"
    ];
  };

  system.stateVersion = "23.11";
}