{ username, ... }:
{
  imports = [
    ./base.nix
    ./environment.nix
    ./graphical/hyprland
    ./graphical/apps.nix
    ./shell/fish.nix
    ./shell/prompt.nix
    ./shell/apps.nix
    ./shell/programming.nix
  ];
}