{ config, pkgs, ... }:
{
  imports = [./hardware-configuration.nix];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  networking = {
    hostName = "uwuki";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    trusted-users = ["rubsad"];
    experimental.features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  time.timeZone = "Europe/Helsinki";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  users.groups.rubsad = {};

  users.users.rubsad = {
    hashedPassword = "$6$ERbtYxGG9UYH8.0j$0Ww2//INdN.DsX1wJu1K.EUikuW/TdFTUyAHHpgtbZrZXqLvi33iG1Id3Na4wR6y6.jaKXQwzGMm8IHVkghM01";
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