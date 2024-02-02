{ pkgs, pkgs-unstable, ... }:
{
  home.packages = with pkgs; [
    brave
    firefox
    floorp
    spotify
    bitwarden
    authy
    pulsemixer
    nvtop
    nsxiv
    gnome.nautilus
    gnome.sushi
    vesktop
    nautilus-open-any-terminal
    pkgs-unstable.vscode-fhs
    pkgs-unstable.jetbrains-toolbox
    pkgs-unstable.gitkraken
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font = {
        normal.family = "FiraCode Nerd Font";
        size = 11;
      };
      cursor.style = {
        shape = "Block";
        blinking = "On";
      };
      mouse.hide_when_typing = true;
      hints.enabled = [{
        regex = "(mailto:|https:|http:|file:|git:|ssh:|ftp:)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+";
        command = "xdg-open";
        post_processing = true;
        mouse.enabled = true;
      }];
    };
  };

  programs.kitty.enable = true;

  programs.mpv.enable = true;
  programs.zathura.enable = true;
}