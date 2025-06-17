{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # LSP
      lua-language-server
      nixd
      openscad-lsp
      pyright
      ruff
      typescript-language-server

      # formatting
      jq
      nixfmt-rfc-style
      prettierd
      stylua

      wl-clipboard

      gcc
      nodejs
      tree-sitter
    ];
  };
}
