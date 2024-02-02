{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    functions = {
      fish_command_not_found = {
        body = "";
      };
    };

    plugins = [
      {
        name = "fzf";
        src = pkgs.fetchFromGitHub {
          owner = "patrickf1";
          repo = "fzf.fish";
          rev = "e5d54b93cd3e096ad6c2a419df33c4f50451c900";
          sha256 = "5cO5Ey7z7KMF3vqQhIbYip5JR6YiS2I9VPRd6BOmeC8=";
        };
      }
    ];

    shellAliases = {
      c = "code";
      v = "$EDITOR";
      g = "git";
      lg = "lazygit";
      cl = "clear";
      vi = "fzf | xargs micro";
    };

    shellAbbrs = {
      gs = "git status";
      gl = "git log";
      gc = "git commit";
      ga = "git add";
      gap = "git add -p";
      gd = "git diff";
      gpl = "git pull";
      gps = "git push";
    };

    shellInit = ''
      # OPAM
      source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    '';

    interactiveShellInit = ''
      # Disable Greeting
      set fish_greeting

      # Theme
      # TokyoNight Color Palette
      set -l foreground c0caf5
      set -l selection 364A82
      set -l comment 565f89
      set -l red f7768e
      set -l orange ff9e64
      set -l yellow e0af68
      set -l green 9ece6a
      set -l purple 9d7cd8
      set -l cyan 7dcfff
      set -l pink bb9af7

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $cyan
      set -g fish_color_keyword $pink
      set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $purple
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink
      set -g fish_color_autosuggestion $comment

      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment
    '';
  };
}