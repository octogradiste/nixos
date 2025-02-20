{ config, pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          path = "~/nixos/wallpaper.jpg";
          blur_passes = 2;
        }
      ];
      label = [
        {
          monitor = "eDP-1";
          text = "$TIME";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono";
          position = "0, 175";
	  halign = "center";
	  valign = "center";
        }
        {
          monitor = "eDP-1";
          text = ''cmd[update:1000] echo $(date +"%A, %B %d")'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrains Mono";
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
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.4)";
        font_color = "rgb(255, 255, 255)";
        fade_on_empty = false;
        position = "0, -50";
      };
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
	after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 60;
          on-timeout = "hyprlock";
        }
        {
          timeout = 120;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/nixos/wallpaper.jpg" ];
      wallpaper = [ ",~/nixos/wallpaper.jpg" ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$modWindow" = "SUPER_SHIFT";
      "$modResize" = "SUPER ALT";
      "$step" = "20";
      bind = [
        "$mod, B, exec, firefox"
        "$mod, T, exec, alacritty"
	"$mod, SPACE, exec, wofi --show drun"

	"$mod, E, killactive"
	"$mod, F, fullscreen, 0"

	"$mod, L, movefocus, r"
	"$mod, H, movefocus, l"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"

	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"

	"$modWindow, L, movewindow, r"
	"$modWindow, H, movewindow, l"
	"$modWindow, K, movewindow, u"
	"$modWindow, J, movewindow, d"

	"$modWindow, 1, movetoworkspace, 1"
	"$modWindow, 2, movetoworkspace, 2"
	"$modWindow, 3, movetoworkspace, 3"
	"$modWindow, 4, movetoworkspace, 4"
	"$modWindow, 5, movetoworkspace, 5"
	"$modWindow, 6, movetoworkspace, 6"
	"$modWindow, 7, movetoworkspace, 7"
	"$modWindow, 8, movetoworkspace, 8"
	"$modWindow, 9, movetoworkspace, 9"

	"$modResize, L, resizeactive, $step 0"
	"$modResize, H, resizeactive, -$step 0"
	"$modResize, K, resizeactive, 0 -$step"
	"$modResize, J, resizeactive, 0 $step"
      ];
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
	",preferred, auto-left, 1.5"
      ];
      input = {
        kb_layout = "ch";
        kb_variant = "fr";
      };
      misc = {
        disable_hyprland_logo = true;
	disable_splash_rendering = true;
      };
      exec-once = "waybar";
    };
  };

  programs.wofi = {
    enable = true;
    settings = {
      gtk_dark = true;
    };
    style = "*{ font-family: monospace; }";
  };

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      modules-left = [
        "hyprland/workspaces"
        "hyprland/submap"
      ];
      modules-right = [
        "battery"
        "clock"
      ];
    }];
  };
}
