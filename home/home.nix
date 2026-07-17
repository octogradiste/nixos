{
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./accounts.nix
    ./hypr
    ./programs
    ./stylix.nix
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
    wl-clipboard
    ripgrep
    nmap

    # virtualisation
    devenv
    direnv
    distrobox
    docker-compose

    # graphics
    darktable
    gimp3
    inkscape

    # programs
    evince
    loupe
    nautilus
    pavucontrol
    simple-scan
    totem
    xournalpp
    libreoffice
    vista-fonts
    gnome-text-editor
    opencode

    texlive.combined.scheme-full

    # social
    signal-desktop

    # editor
    neovim
    lua-language-server
    stylua
    nixd
    nixfmt
  ];

  programs.wofi.enable = true;

  services.dunst.enable = true;

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    settings = {
      program_options = {
        file_manger = "nautilus";
      };
    };
  };

  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "battery"
          "clock"
        ];
      }
    ];
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "26.11";
}
