{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../wallpaper.jpg;
    cursor.size = 24;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  };
}
