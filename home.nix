{ config, pkgs, ... }:

{
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    htop
  ];

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
