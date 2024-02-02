{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Move Everything To Their Place
      "monitor DP-1, class:^(league of legends.exe)$"
      "monitor DP-1, class:^(leagueclientux.exe)$"
      "monitor DP-1, class:^(leagueclient.exe)$"
      "monitor DP-1, class:^(Minecraft.*)$"
      "workspace 9 silent, class:^(explorer.exe)$"
      "workspace 11, class:^(VencordDesktop)$"
      "workspace 12 silent, class:^(Spotify)$"

      # Float
      "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"

      # Opacity
      "opacity 0.9, class:^(.*)$"

      "opacity 1, class:^(Brave-browser)$"
      "opacity 1, class:^(league of legends.exe)$"
      "opacity 1, class:^(steam_app.*)$"
      "opacity 1, class:^(gamescope)$"
      "opacity 1, class:^(factorio)$"
      "opacity 1, class:^(Minecraft.*)$"
      "opacity 1, class:^(pinta)$"

      # Tearing
      "immediate, class:^(steam_app_.*)$"
      "immediate, class:^(gamescope)$"
      "immediate, class:^(Golf With Your Friends.x86_64)$"
      "immediate, class:^(factorio)$"
      "immediate, class:^(overwatch.exe)$"
      "immediate, class:^(league of legends.exe)$"
      "immediate, class:^(Minecraft.*)$"

      # Fix Emote Window
      "noinitialfocus, class:^(emote)$"
    ];
  };
}