{pkgs, ...}:
{
  imports = [];

  home = {
    username = "rubsad";
    homeDirectory = "/home/rubsad";

    packages = with pkgs; [
      neofetch
    ];

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}