{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hypr
    ./programs
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    # system
    htop
    brightnessctl
    pulseaudio

    # archive
    zip
    unzip

    # utilities
    pavucontrol
    nautilus
    xournalpp

    # social
    signal-desktop
  ];

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

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
