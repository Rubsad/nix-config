{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-4, 2560x1440@144, 0x0, 1"
      "DP-5, 1920x1080@144, 2560x280, 1"
    ];

    workspace = [
      # Workspace Definitions
      "DP-4,1"
      "DP-5,11"

      "1,monitor:DP-4"
      "2,monitor:DP-4"
      "3,monitor:DP-4"
      "4,monitor:DP-4"
      "5,monitor:DP-4"
      "6,monitor:DP-4"
      "7,monitor:DP-4"
      "8,monitor:DP-4"
      "9,monitor:DP-4"
      "10,monitor:DP-4"

      "11,monitor:DP-5"
      "12,monitor:DP-5"
      "13,monitor:DP-5"
      "14,monitor:DP-5"
      "15,monitor:DP-5"
      "16,monitor:DP-5"
      "17,monitor:DP-5"
      "18,monitor:DP-5"
      "19,monitor:DP-5"
      "20,monitor:DP-5"

      # Special Workspaces
      "special:processes, on-created-empty:$TERMINAL -e btop"
      "special:audiomixer, on-created-empty:$TERMINAL -e pulsemixer"
      "special:scratchpad, on-created-empty:$TERMINAL"
    ];
  };
}
