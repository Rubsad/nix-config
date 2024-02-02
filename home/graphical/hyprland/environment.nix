{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      # Wayland
      "XDG_CURRENT_DESKTOP, Hyprland"
      "XDG_SESSION_DESKTOP, Hyprland"
      "XDG_SESSION_TYPE, wayland"

      # QT
      "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
      "QT_QPA_PLATFORM, wayland;xcb"
      "QT_QPA_PLATFORMTHEME, qt5ct"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"

      # GTK
      "GDK_BACKEND, wayland,x11"

      # GNOME Keyring SSH
      "SSH_AUTH_SOCK, $XDG_RUNTIME_DIR/keyring/ssh"

      # Tearing
      "WLR_DRM_NO_ATOMIC, 1"

      # Other
      "XCURSOR_SIZE, 24"
    ];

    exec-once = [
      # Privilege Elevation
      "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"

      # Wallpaper
      "hyprpaper"

      # Password Manager
      "bitwarden"

      # Clipboard persist
      "wl-clip-persist --clipboard regular"

      # Peripherals
      "goxlr-daemon"

      # Apps
      "vencorddesktop"
      "spotify"
      "emote"
    ];
  };
}