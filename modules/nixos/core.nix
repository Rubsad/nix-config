{lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
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

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = ["/"];
  };

  environment.shells = with pkgs; [
    bash
    fish
    nushell
  ];

  programs.fish.enable = true;

  users.defaultUserShell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    micro
    curl
    wget
    git
    ripgrep
    fd
    gcc
    gnumake
    unzip
    zip
    psmisc
    lshw
    file
  ];

  environment.variables.EDITOR = "micro";
}