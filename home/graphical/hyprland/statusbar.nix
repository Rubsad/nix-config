{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        layer = "top";
        height = 24;
        spacing = 10;
        modules-left = ["hyprland/workspaces" "custom/separator" "hyprland/window"];
        modules-center = ["mpris"];
        modules-right = ["hyprland/language" "custom/separator" "clock"];
        "hyprland/workspaces" = {
          persistent-workspaces = {
            DP-1 = [1 2 3 4 5 6 7 8 9];
            DP-2 = [11 12 13 14 15 16 17 18 19];
          };
          format = "{icon}";
          format-icons = {
            "11" = "1";
            "12" = "2";
            "13" = "3";
            "14" = "4";
            "15" = "5";
            "16" = "6";
            "17" = "7";
            "18" = "8";
            "19" = "9";
          };
        };
        "custom/separator" = {
          "format" = "|";
        };
        "hyprland/window" = {};
        "mpris" = {
          player = "spotify";
          interval = 1;
          format = "{artist}: {title} - {position}|{length}";
          format-paused = "Hello darkness my old friend";
          tooltip-format = "";
          on-click = "rde_toggle_widget music";
        };
        "hyprland/language" = {
          format = {};
          format-fi = "🇫🇮";
          format-us = "🇺🇸";
        };
        clock = {
          interval = 1;
          format = "{:%a, %d/%m/%Y  |  %H:%M:%S}";
          on-click = "rde_toggle_widget calendar";
        };
      };
    };
    systemd.enable = true;
    style = ../configs/waybar/style.css;
  };
}