{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    rsync
  ];

  programs.command-not-found.enable = false;
  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.direnv.enable = true;
  programs.zoxide.enable = true;
  programs.eza = {
    enable = true;
    enableAliases = true;
    extraOptions = ["--group-directories-first"];
    icons = true;
    git = true;
  };
  programs.fzf.enable = true;
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      pager = "bat";
      aliases = {
        co = "pr checkout";
      };
    };
  };
  programs.git = {
    enable = true;
    userName = "Rubsad";
    userEmail = "109631974+Rubsad@users.noreply.github.com";
    extraConfig = {
      credential.helper = "cache";
      init.defaultBranch = "main";
    };
    lfs.enable = true;
    delta.enable = true;
  };
  programs.jq.enable = true;
  programs.lazygit = {
    enable = true;
    settings = {
      gui.showIcons = true;
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
      notARepository = "quit";
    };
  };
  programs.lf.enable = true;
}
