{...}: {
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
        "$mod, X, exec, xournalpp"

        "$mod, SPACE, exec, wofi --show drun"
        "$mod, RETURN, exec, loginctl lock-session"

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

        ",XF86AudioLowerVolume, exec, pactl -- set-sink-volume 0 -10%"
        ",XF86AudioRaiseVolume, exec, pactl -- set-sink-volume 0 +10%"
        ",XF86AudioMute, exec, pactl -- set-sink-mute 0 toggle"
        ",XF86AudioMicMute, exec, pactl -- set-source-mute 0 toggle"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ",XF86MonBrightnessUp, exec, brightnessctl s +10%"

        ",PRINT, exec, hyprshot -m region --clipboard-only"
        "SHIFT, PRINT, exec, hyprshot -m window --clipboard-only"
        "CONTROL, PRINT, exec, hyprshot -m active -m output --clipboard-only"
      ];
      binde = [
        "$modResize, L, resizeactive, $step 0"
        "$modResize, H, resizeactive, -$step 0"
        "$modResize, K, resizeactive, 0 -$step"
        "$modResize, J, resizeactive, 0 $step"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 10;
        resize_on_border = true;
        hover_icon_on_border = true;
      };
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
        ",preferred, auto-left, 1.5"
      ];
      animations = {
        enabled = false;
      };
      input = {
        kb_layout = "ch";
        kb_variant = "fr";
        touchpad = {
          natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.3;
        workspace_swipe_distance = 200;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      exec-once = "waybar";
    };
  };
}
