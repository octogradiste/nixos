{...}: let
  wallpaper = "/etc/nixos/wallpaper.jpg";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [wallpaper];
      wallpaper = [",${wallpaper}"];
    };
  };
}
