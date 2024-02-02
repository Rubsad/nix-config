{ pkgs, lib, ... }:
let
  scripts = pkgs.callPackage ../../../../pkgs/scripts.nix {};
in
{
  # Notifications
  services.mako = {
    enable = true;
    font = "Noto Sans 10";
    backgroundColor = "#000000BB";
    borderSize = 0;
    borderRadius = 8;
    defaultTimeout = 5000;
    ignoreTimeout = true;
    margin = "20";
  };

  # Popup Widgets
  programs.eww = {
    enable = true;
    configDir = ../configs/eww;
    package = pkgs.eww-wayland;
  };

  systemd.user.services.eww = {
    Unit = { Description = "Widget system"; };
    Service = {
      Type = "exec";
      ExecStart = "${pkgs.eww-wayland}/bin/eww daemon --no-daemonize";
      Restart = "on-failure";
      Environment = "\"PATH=${with pkgs; lib.makeBinPath [systemd scripts.rde-toggle-widget bash hyprland eww-wayland]}\"";
    };
    Install = { WantedBy = ["graphical-session.target"]; };
  };

  # Secrets Provider
  services.gnome-keyring = {
    enable = true;
    components = ["secrets" "ssh"];
  };

  # Media Player Info Daemon
  services.playerctld.enable = true;

  # Device Auto Mount
  services.udiskie.enable = true;

  # Bluetooth Manager
  services.blueman-applet.enable = true;

  # Network Manager
  services.network-manager-applet.enable = true;
}