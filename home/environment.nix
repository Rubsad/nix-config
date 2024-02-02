{ config, ... }:
let
  vars = config.home.sessionVariables;
in {
  home.sessionVariables = {
    # Defaults
    EDITOR = "micro";
    BROWSER = "brave";
    TERMINAL = "alacritty";

    # XDG
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Custom Home Directories
    CHD_BIN_HOME = "$HOME/.local/bin";
    CHD_SRC_HOME = "$HOME/.local/src";

    # Cleaner Home
    GOPATH = "${vars.CHD_SRC_HOME}/go";
    CARGO_HOME = "${vars.XDG_DATA_HOME}/cargo";
    CUDA_CACHE_PATH = "${vars.XDG_CACHE_HOME}/nv";
    GNUPGHOME = "${vars.XDG_DATA_HOME}/gnupg";
    LESSHISTFILE = "${vars.XDG_CACHE_HOME}/less/history";
    NODE_REPL_HISTORY = "${vars.XDG_DATA_HOME}/node_repl_history";
    WINEPREFIX = "${vars.XDG_DATA_HOME}/wine";
    NPM_CONFIG_USERCONFIG = "${vars.XDG_CONFIG_HOME}/npm/npmrc";
  };

  home.sessionPath = [
    "${vars.CHD_BIN_HOME}"
    "${vars.CARGO_HOME}/bin"
    "${vars.GOPATH}/bin"
    "${vars.XDG_DATA_HOME}/npm/bin"
  ];
}