{ pkgs, pkgs-unstable, hyprsome, ... }:
let
  scripts = pkgs.callPackage ../../../../pkgs/scripts.nix {};
in
{
  imports = [
    ./workspaces.nix
    ./environment.nix
    ./input.nix
    ./windowrules.nix
    ./services.nix
    ./statusbar.nix
    ./theming.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
    tofi
    libnotify
    wl-clipboard
    wl-clip-persist
    playerctl
    bc
    waylock
    wtype
    scripts.rde-toggle-widget
    scripts.scrsht
    emote
    etcher
    hyprsome.packages.${pkgs.system}.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    settings = {
      general = {
        allow_tearing = true;

        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      dwindle = {
        preserve_split = true;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        col.shadow = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = false;
      };
    };
  };

  home.file.".local/wallpaper.png".source = ./wallpaper.png;
  xdg.configFile."hypr/hyprpaper.conf".source = ../configs/hyprpaper.conf;

  xdg.configFile."tofi/config".source = ../configs/tofi/config;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
          "text/plain" = ["micro.desktop"];
          "x-scheme-handler/http" = ["brave-browser.desktop"];
          "x-scheme-handler/https" = ["brave-browser.desktop"];
          "x-scheme-handler/webcal" = ["brave-browser.desktop"];
          "text/html" = ["brave-browser.desktop"];
          "application/pdf" = ["org.pwmt.zathura.desktop"];
          "inode/directory" = ["org.gnome.Nautilus.desktop"];
          "x-scheme-handler/jetbrains" = ["JetBrains Toolbox.desktop"];
        };
    };
}