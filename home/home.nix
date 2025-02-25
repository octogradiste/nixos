{pkgs, ...}: {
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  home.packages = with pkgs; [
    htop
    xournalpp
    nodejs_23
    brightnessctl
    pulseaudio
  ];

  imports = [
    ./hypr
  ];

  programs.firefox.enable = true;

  programs.tmux.enable = true;

  programs.wofi.enable = true;

  services.dunst.enable = true;

  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "battery"
          "clock"
        ];
      }
    ];
  };

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
