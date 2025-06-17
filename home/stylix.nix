{ pkgs, username, ... }:
{
  stylix = {
    enable = true;
    image = ../wallpaper.jpg;
    cursor = {
      size = 24;
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    fonts = {
      monospace = {
        name = "JetBrainsMono Nerd Font Mono";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
    };
    targets = {
      neovim.enable = false;
      vscode.enable = false;
      firefox = {
        enable = true;
        profileNames = [ username ];
      };
    };
  };
}
