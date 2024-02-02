{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_20
    bun
    deno
    go
    opam
    rustup
    poetry
    python3
    lua-language-server
    clang-tools_17
    marksman
    stylua
    elixir_1_16
    ruby_3_3
    nixd
    nil
  ];

  xdg.configFile."npm/npmrc".source = ./npmrc;
}