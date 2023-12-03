{ config, lib, pkgs, ...}:
{
  environment.shells = with pkgs; [
    bash
    fish
  ];

  programs.fish.enable = true;

  users.defaultUserShell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    psmisc
    mako
    polkit-kde-agent
    (eww.override {
      withWayland = true;
    })
    hyprpaper
    wofi

  ];

  security.rtkit.enable = true;

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      (nerdfonts.override {
        fonts = ["FiraCode"];
      })
    ];

    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["FiraCode Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

}