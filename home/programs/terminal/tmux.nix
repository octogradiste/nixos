{...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    extraConfig = ''
      # Fix Colors
      set -g default-terminal "screen-256color"
      set -as terminal-features ",xterm-256color:RGB"

      # Statusline
      set -g window-status-current-style fg=terminal,bold
    '';
  };
}
