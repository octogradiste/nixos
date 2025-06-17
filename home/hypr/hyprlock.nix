{ lib, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        ignore_empty_input = true;
        no_fade_in = true;
        no_fade_out = true;
      };
      background = {
        blur_passes = lib.mkForce 1;
      };
      label = [
        {
          monitor = "eDP-1";
          text = "$TIME";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          position = "0, 175";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "eDP-1";
          text = ''cmd[update:1000] echo $(date +"%A, %B %d")'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = {
        monitor = "eDP-1";
        size = "200, 50";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        fade_on_empty = false;
        position = "0, -50";
      };
    };
  };
}
