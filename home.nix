{ config, pkgs, ... }:

{
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    htop
    xournalpp
    nodejs_23
  ];

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
    extraConfig = ''
bind=$mod,R,submap,resize

submap=resize

$step=20

binde=,L,resizeactive,$step 0
binde=,H,resizeactive,-$step 0
binde=,K,resizeactive,0 -$step
binde=,J,resizeactive,0 $step

bind=SHIFT,L,movewindow,r
bind=SHIFT,H,movewindow,l
bind=SHIFT,K,movewindow,u
bind=SHIFT,J,movewindow,d

bind=,ESCAPE,submap,reset
bind=,ENTER,submap,reset

submap=reset
    '';
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

  programs.firefox.enable = true;

  programs.neovim.enable = true;
  programs.tmux.enable = true;

  programs.git = {
    enable = true;
    userName = "octogradiste";
    userEmail = "colin.berger@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      push.autoSetupRemote = true;
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -l";
    };
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
