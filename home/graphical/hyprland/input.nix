{ ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        # Keyboard
        kb_layout = "fi,us";
        kb_options = "caps:super";

        numlock_by_default = true;

        repeat_rate = 30;
        repeat_delay = 500;

        # Mouse
        follow_mouse = 1;

        sensitivity = -0.5;
      };

      "$mod" = "SUPER";
      bind = [
        ## System
        # Powermenu
        "$mod SHIFT, Q, exec, rde_toggle_widget powermenu"
        # App Launcher
        "$mod, D, exec, tofi-drun | xargs hyprctl dispatch exec --"
        # Script Runner
        "$mod SHIFT, D, exec, ls ~/.local/bin | tofi | xargs hyprctl dispatch exec --"
        # Screen Lock
        "$mod, X, exec, waylock -init-color 0x000000 -input-color 0x00ff00 -fail-color 0xff0000"
        # Switch Keyboard Layout
        "$mod, B, exec, hyprctl switchxkblayout 'dakai-ps/2+usb-keyboard' next && systemctl --user restart xcape"
        # Scratchpad
        "$mod, minus, togglespecialworkspace, scratchpad"
        # Overlay Audio Mixer
        ",XF86Tools, togglespecialworkspace, audiomixer"
        # Overlay Resource Monitor
        "$mod, R, togglespecialworkspace, processes"

        ## Apps
        # Terminal
        "$mod, return, exec, $TERMINAL"
        # GUI File Manager
        "$mod, E, exec, nautilus -w"
        # Terminal File Manager
        "$mod SHIFT, E, exec, $TERMINAL -e lf"
        # Web Browser
        "$mod, W, exec, $BROWSER"
        # Overlay 2FA
        "$mod, S, exec, authy"
        # Emote menu
        "$mod, S, exec, emote"

        ## Music
        # Play/Pause
        ", XF86AudioPlay, exec, playerctl -p spotify play-pause"
        # Previous
        ", XF86AudioPrev, exec, playerctl -p spotify previous"
        # Next
        ", XF86AudioNext, exec, playerctl -p spotify next"

        ## Window
        # Close
        "$mod, Q, killactive"
        # Toggle Float
        "$mod, F, togglefloating"

        ## Screenshot
        # Area
        "$mod SHIFT, Z, exec, scrsht area"
        # Current Window
        "$mod, Z, exec, scrsht window"
        # Current Screen
        "$mod ALT, Z, exec, scrsht screen"

        # Move focus with Super + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, r"

        # Switch workspaces with mod + [0-9]
        "$mod, 1, exec, hyprsome workspace 1"
        "$mod, 2, exec, hyprsome workspace 2"
        "$mod, 3, exec, hyprsome workspace 3"
        "$mod, 4, exec, hyprsome workspace 4"
        "$mod, 5, exec, hyprsome workspace 5"
        "$mod, 6, exec, hyprsome workspace 6"
        "$mod, 7, exec, hyprsome workspace 7"
        "$mod, 8, exec, hyprsome workspace 8"
        "$mod, 9, exec, hyprsome workspace 9"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, exec, hyprsome move 1"
        "$mod SHIFT, 2, exec, hyprsome move 2"
        "$mod SHIFT, 3, exec, hyprsome move 3"
        "$mod SHIFT, 4, exec, hyprsome move 4"
        "$mod SHIFT, 5, exec, hyprsome move 5"
        "$mod SHIFT, 6, exec, hyprsome move 6"
        "$mod SHIFT, 7, exec, hyprsome move 7"
        "$mod SHIFT, 8, exec, hyprsome move 8"
        "$mod SHIFT, 9, exec, hyprsome move 9"
      ];

      bindm = [
        # Move/resize windows with mod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };

    extraConfig = ''
      # Temp Hotkey Disabling
      bind = $mod ALT SHIFT, p, submap, disabled

      submap = disabled

      bind = $mod, escape, submap, reset

      submap = reset
    '';
  };
}